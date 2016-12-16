#!/bin/sh
#
# Setup SSH users for doing backup

echo
echo "Don't just run this script."
echo "Run it line by line as required."
echo "Read the comments."
echo
exit 1

# BACKUP server only
# Note, this is already for:
# root@**NEW**.wiki.jsc.nasa.gov <-- import from <-- remotebackupuser@wiki.jsc.nasa.gov
#
# If you want to backup FROM wiki.jsc.nasa.gov TO another.server.com you'd need
# to do this there. For "description", example: remotebackupuser@new-wiki-jsc-nasa-gov
sudo su
ssh-keygen -t rsa -b 4096 -C "remotebackupuser@description-of-server-you-are-backing-up-to"

# SOURCE server only
# Note: this is already done on the wiki.jsc.nasa.gov AND SHOULD NOT BE
# BE REPEATED FOR OTHER SERVERS WANTING TO BACKUP wiki.jsc.nasa.gov
sudo su
backup_user_name="remotebackupuser"
useradd "$backup_user_name"
mkdir -p "/home/$backup_user_name/.ssh"
chown "$backup_user_name" "/home/$backup_user_name/.ssh"
chmod 700 "/home/$backup_user_name/.ssh"
touch "/home/$backup_user_name/.ssh/authorized_keys"
chmod 600 "/home/$backup_user_name/.ssh/authorized_keys"
chown "$backup_user_name" "/home/$backup_user_name/.ssh/authorized_keys"

# still on SOURCE, continue with the following
# NOTE: if backing up wiki.jsc.nasa.gov from something other than the **NEW**
# wiki.jsc.nasa.gov, you will need to repeat this by adding to authorized_keys
# the id_rsa.pub file you generated above in the "backup only" section
vim "/home/$backup_user_name/.ssh/authorized_keys"
	# THEN: paste id_rsa.pub from root@backup-server into authorized_keys on source
	# DON'T erase existing keys on wiki.jsc.nasa.gov. Those are for

sudo ssh remotebackupuser@SOURCE-SERVER
	# VERIFY access WITHOUT typing a password

