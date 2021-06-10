# $1 message to decrypt
# $2 out.txt

MyIdentity=$(cat util/default_identity.txt)
MyPrivKey=identities/$MyIdentity/"$MyIdentity"_privkey.pem
./util/decrypt.sh $MyPrivKey $1 $2
