# $1 message to decrypt
# $2 out.txt

mkdir contacts 2> /dev/null

MyIdentity=$(cat util/default_identity.txt)
MyPrivKey=identities/$MyIdentity/"$MyIdentity"_privkey.pem
./util/decrypt.sh $MyPrivKey $1 $2
