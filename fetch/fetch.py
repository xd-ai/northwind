import pysftp
import fnmatch

cnopts=pysftp.CnOpts()
cnopts.hostkeys=None

def fetch_csv():
    with pysftp.Connection('127.0.0.1', username='sftpuser01', password='sftpuser01', cnopts=cnopts) as sftp:
        for filename in sftp.listdir('data/'):
            if fnmatch.fnmatch(filename, "enc_*"):
                sftp.get("data/" + filename, "data/" + filename)

