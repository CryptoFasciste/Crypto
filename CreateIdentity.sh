#$1 name

# Create Folder
mkdir identities/$1

# Create private key
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -pkeyopt rsa_keygen_pubexp:3 -out identities/$1/$1_privkey.pem

# Create public key
openssl pkey -in identities/$1/$1_privkey.pem -out identities/$1/$1_pubkey.pem -pubout

# Add user as default
read -p "Set as default user [y/n]: " add_user
if [ "$add_user" == "y" ] || [ "$add_user" == "yes" ];
then
	echo $1 > util/default_identity.txt
fi
