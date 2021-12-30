insert into order_fact 
(product_key,
 customer_key,
 employee_key,
 order_date_key,
 required_date_key,
 shipped_date_key,
 order_id,
 unit_price,
 quantity,
 discount,
 ship_via,
 freight,
 ship_name,
 ship_address,
 ship_city,
 ship_region,
 ship_postal_code,
 ship_country)
 select 
  product_dim.product_key,
  customer_dim.customer_key,
  employee_dim.employee_key,
  d1.date_key,
  d2.date_key,
  d3.date_key,
  t.order_id,
  t.unit_price,
  t.quantity,
  t.discount,
  t.ship_via,
  t.freight,
  t.ship_name,
  t.ship_address,
  t.ship_city,
  t.ship_region,
  t.ship_postal_code,
  t.ship_country 
 from tmp t
 left outer join 
  	product_dim 
  	on product_dim.product_id = t.product_id
 left outer join
 	customer_dim 
 	on customer_dim.customer_id = t.customer_id 
 left outer join 
 	employee_dim 
 	on employee_dim.employee_id = t.employee_id 
 left outer join 
 	date_dim as d1
 	on d1."date" = t.order_date 
 left outer join 
 	date_dim as d2
 	on d2."date" = t.required_date 
 left outer join 
 	date_dim as d3
 	on d3."date" = t.shipped_date;
 
DROP TABLE public.tmp;
