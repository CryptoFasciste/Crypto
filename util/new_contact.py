#!usr/bin/env python3

"""
Code written by Mattias
On 09/06/2021
The aim of this program is to check if a contact is new
"""

#import sys
import os


def main():
    s1 = ""
    f = open("recieved_pubkey.pen")
    for l in f.readlines():
        s1 += l
    f.close()
    for root, dirs, files in os.walk("./contacts/"):
        for name in files:
            s2 = ""
            f = open("./contacts/" + name)
            for l in f.readlines():
                s2 += l
            f.close()
            if s1 == s2:
                print(name)
                return(0)
    print("unkown contact")
    return(0)


if __name__ == "__main__":
    main()
