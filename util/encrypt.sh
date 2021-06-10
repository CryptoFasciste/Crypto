# $1 = Sender private key
# $2 = Sender public key
# $3 = Reciever public key
# $4 = message to encrypt
# $5 = encrypted message

# Create signature
openssl dgst -sha1 -sign $1 -out sign.bin $4
openssl enc -base64 -in sign.bin -out sign.bin.base64
rm sign.bin

# Create encrypted message
openssl pkeyutl -encrypt -in $4 -pubin -inkey $3 -out crypted.bin
openssl enc -base64 -in crypted.bin -out crypted.bin.base64
rm crypted.bin

# Create formatters
echo -----BEGIN MESSAGE----- > begin_message.txt
echo -----END MESSAGE----- > end_message.txt
echo -----BEGIN SIGNATURE----- > begin_signature.txt
echo -----END SIGNATURE----- > end_signature.txt


# Concatenate PubKey, EncryptMess and Sign into send
cat $2 begin_message.txt crypted.bin.base64 end_message.txt begin_signature.txt sign.bin.base64 end_signature.txt > $5
rm crypted.bin.base64 sign.bin.base64 begin_message.txt end_message.txt begin_signature.txt end_signature.txt

