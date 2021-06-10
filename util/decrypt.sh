# $1 private key
# $2 recieved data
# $3 clear message

# Parse
python util/parser.py $2

# Manage contacts
contact_name=$(python util/new_contact.py)
if [ "$contact_name" == "unkown contact" ];
then
	echo unkown contact, please enter its name
	read -p "Contact : " contact_name
	contact_name="$contact_name"_pubkey.pem
	mv recieved_pubkey.pen contacts/$contact_name
else
	echo contact is $contact_name | sed 's/_pubkey.pem//'
fi

# Change base
openssl enc -base64 -d -in recieved_encrypted_message.bin.base64 -out recieved_encrypted_message.bin
openssl enc -base64 -d -in recieved_encrypted_signature.bin.base64 -out recieved_encrypted_signature.bin

# Decrypt
openssl pkeyutl -decrypt -in recieved_encrypted_message.bin -inkey $1 -out $3

# Verify encrypted_signature
openssl dgst -sha1 -verify contacts/$contact_name -signature recieved_encrypted_signature.bin $3

# Clear
rm recieved*
