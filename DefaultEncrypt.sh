# $1 = Recievers name
# $2 = message to encrypt
# $3 = encrypted message

MyIdentity=$(cat util/default_identity.txt)
MyPrivKey=identities/$MyIdentity/"$MyIdentity"_privkey.pem
MyPubKey=identities/$MyIdentity/"$MyIdentity"_pubkey.pem
RecieverPubKey=contacts/$1_pubkey.pem
./util/encrypt.sh $MyPrivKey $MyPubKey $RecieverPubKey $2 $3
