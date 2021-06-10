#!usr/bin/env python3

"""
Code written by Mattias
On 09/06/2021
The aim of this program is to parse encrypted data
"""

import sys


def main(parameters):
    reading_pubkey = -1
    reading_message = -1
    reading_signature = -1
    senders_pubkey = open("recieved_pubkey.pen", "wb")
    message = open("recieved_encrypted_message.bin.base64", "wb")
    signature = open("recieved_encrypted_signature.bin.base64", "wb")
    data = open(parameters[1], 'rb')

    for l in data.readlines():
        if (l == b'-----BEGIN PUBLIC KEY-----\n'):
            reading_pubkey = 1
        if (l == b'-----END PUBLIC KEY-----\n'):
            reading_pubkey = -1
            senders_pubkey.write(l)
        if (l == b'-----BEGIN MESSAGE-----\n'):
            reading_message = 1
        if (l == b'-----END MESSAGE-----\n'):
            reading_message = -1
        if (l == b'-----BEGIN SIGNATURE-----\n'):
            reading_signature = 1
        if (l == b'-----END SIGNATURE-----\n'):
            reading_signature = -1
        if (reading_pubkey > 0):
            reading_pubkey += 1
        if (reading_message > 0):
            reading_message += 1
        if (reading_signature > 0):
            reading_signature += 1
        if (reading_pubkey > 1):
            senders_pubkey.write(l)
        if (reading_message > 2):
            message.write(l)
        if (reading_signature > 2):
            signature.write(l)

    senders_pubkey.close()
    message.close()
    signature.close()
    data.close()
    return(0)


if __name__ == "__main__":
    main(sys.argv)
