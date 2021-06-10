# Crypto
An easy to use cipher tool

# How to use

## Step one : Create a user
```zsh
./CreateIdentity.sh USERNAME
```
This will ask you wether or not you want to make this user default, hit y and enter

## Step two : Sharing your public key
Your public key is in identities/USERNAME/USERNAME_pubkey.pem
share it how ever you want ! (Mail, discord, letter, anything)
But be careful to NEVER share your private key

## Step three : Getting someone's message
Just type in
```zsh
./DefaultDecrypt.sh CIPHERED_MESSAGE CLEAR_MESSAGE
```
If it is your first time chatting with this user the command will ask you to give it a name
then the user public key will be stored in contacts

## Step four : Writing a message
Write your message the way you like in plain text (vim message.txt for exemple)
Then type in
```
./DefaultDecrypt.sh RECIPIENT'S_NAME CLEAR_MESSAGE CIPHERED_MESSAGE
```
and then you get a chipered message you can send any way you like (mail, post, discord)
If anyone intercepts this message, they won't be able to understand it

And that's it!

Chat safely and don't play too much minecraft on your PC ;)
