#!/bin/sh

mv vsftpd.conf /etc/vsftpd/vsftpd.conf

# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
adduser -D ${FTP_USER}
# set pass word to the user added bfore
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd 
#changes the owner and primary group of a file /home/lsaidi
chown -R ${FTP_USER}:${FTP_USER} /home/lsaidi
chmod 777 -R /home/lsaidi
echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

#start the vsftpd service
vsftpd /etc/vsftpd/vsftpd.conf