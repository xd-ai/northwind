# from fetch.fetch import fetch_csv
# from decode.pgp import decrypt
import pandas as pd
import psycopg2 as db 
from sqlalchemy import create_engine

# fetch_csv()
# decrypt()

data_path = 'data/'

conn_string = "dbname='northwind' host='postgres' user='postgres' password='postgres'"
conn = db.connect(conn_string)
cur = conn.cursor()

cur.execute(open('sql/customer_dim.sql', 'r').read())
conn.commit()
cur.execute(open('sql/product_dim.sql', 'r').read())
conn.commit()
cur.execute(open('sql/date_dim.sql', 'r').read())
conn.commit()
cur.execute(open('sql/employee_dim.sql', 'r').read())
conn.commit()
cur.execute(open('sql/order_fact.sql', 'r').read())
conn.commit()
cur.execute(open('sql/tmp.sql', 'r').read())
conn.commit()

engine = create_engine('postgresql://postgres:postgres@postgres/northwind')

customer_cols     = ['customer_id', 'company_name', 'contact_name', 'contact_title', 'address', 'city', 'region', 'postal_code', 'country', 'phone', 'fax']
employee_cols     = ['employee_id', 'last_name', 'first_name', 'title', 'title_of_courtesy', 'birth_date', 'hire_date', 'address', 'city', 'region', 'postal_code', 'country', 'home_phone', 'extension', 'photo', 'notes', 'reports_to', 'photo_path']
product_cols      = ['product_id', 'product_name', 'supplier_id', 'category_id', 'quantity_per_unit', 'unit_price', 'units_in_stock', 'units_on_order', 'reorder_level', 'discontinued']
category_cols     = ['category_id', 'category_name', 'category_description', 'category_picture']
supplier_cols     = ['supplier_id', 'supplier_company_name', 'supplier_contact_name', 'supplier_contact_title', 'supplier_address', 'supplier_city', 'supplier_region', 'supplier_postalCode', 'supplier_country', 'supplier_phone', 'supplier_fax', 'supplier_homepage']
order_cols        = ['order_id', 'customer_id', 'employee_id', 'order_date', 'required_date', 'shipped_date', 'ship_via', 'freight', 'ship_name', 'ship_address', 'ship_city', 'ship_region', 'ship_postal_code', 'ship_country']
order_detail_cols = ['order_id', 'product_id', 'unit_price', 'quantity', 'discount']

customers     = pd.read_csv(data_path + 'customers.csv')
employees     = pd.read_csv(data_path + 'employees.csv')
products      = pd.read_csv(data_path + 'products.csv')
categories    = pd.read_csv(data_path + 'categories.csv')
suppliers     = pd.read_csv(data_path + 'suppliers.csv')
orders        = pd.read_csv(data_path + 'orders.csv')
order_details = pd.read_csv(data_path + 'order_details.csv')

customers.columns     = customer_cols
employees.columns     = employee_cols
products.columns      = product_cols
categories.columns    = category_cols
suppliers.columns     = supplier_cols
orders.columns        = order_cols
order_details.columns = order_detail_cols

customers.to_sql('customer_dim', engine, if_exists='append', index=False)
employees.to_sql('employee_dim', engine, if_exists='append', index=False)
products.to_sql('product_dim', engine, if_exists='append', index=False)

orders['order_date'].fillna('2199-01-01 00:00:00.000', inplace=True)
orders['required_date'].fillna('2199-01-01 00:00:00.000', inplace=True)
orders['shipped_date'].fillna('2199-01-01 00:00:00.000', inplace=True)

date_df = orders[['order_date', 'required_date', 'shipped_date']].copy()
date_df = date_df['order_date'].append(date_df['required_date']).append(date_df['shipped_date']).reset_index().drop(columns=['index']).drop_duplicates()
date_df.columns = ['date']
date_df.to_sql('date_dim', engine, if_exists='append', index=False)

tmp = pd.merge(orders, order_details, on='order_id')
tmp.to_sql('tmp', engine, if_exists='append', index=False)

cur.execute(open('sql/populate.sql', 'r').read())
conn.commit()
