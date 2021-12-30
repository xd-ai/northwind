import gnupg
import os
import fnmatch

gpg = gnupg.GPG()
with open('key/pgp.asc') as k:
    key_data = k.read()
    gpg.import_keys(key_data)

def decrypt():
    for f in os.listdir('data/'):
        if fnmatch.fnmatch(f, "enc_*"):
            with open('data/' + f, 'rb') as enc:
                gpg.decrypt_file(enc, passphrase='sftpuser01', output='data/' + f[4:])
            os.remove('data/' + f)
