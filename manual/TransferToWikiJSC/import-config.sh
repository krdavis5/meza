#!/bin/bash
#
# This is a an import-config.sh file for pulling from wiki.jsc

echo
echo "This file has some values which need to be filled in."
echo "Find everything in {{curly braces}} and replace with appropriate values."
echo "Then remove these lines."
echo
exit 1


#
# GETTING FILES AND/OR SQL VIA SSH
remote_domain=wiki.jsc.nasa.gov
remote_ssh_username="remotebackupuser"

remote_db_username=root
remote_db_password={{GET WIKI ROOT PASSWORD FROM WIKI.JSC}}


# Location for backups to be stored, e.g. path to your wiki imports
imports_dir="/opt/meza-backup"
local_wiki_backup="$imports_dir" # used in backup-remote-wikis.sh


# MySQL root password for local database
mysql_root_pass={{INSERT ROOT PASSWORD FOR NEW SERVER}}

# Use a webhook, or just put "n" for no
slackwebhook={{INSERT SLACK WEBHOOK OR "n"}}}

# space-delimited list of wikis you want to import.
# If you want to import all wikis, do `which_wikis="IMPORT_ALL"`
# This may or may not be used in multiple scripts
# which_wikis="fod"
which_wikis="IMPORT_ALL"


# Each run of this script should clone the latest version of the wiki. Removing
# the old version is required.
overwrite_existing_wikis=true

# For changing servers we're not concerned with keeping backups. Each time this
# script runs we want to pull the latest data and throw away the old stuff.
keep_imports_directories=false

# While the current production server shouldn't have database differences from
# this new server, better not to risk it on the our future production server.
skip_database_update=false
skip_smw_rebuild=false


#
# LOG FILES for backup-remote-wikis.sh
#

# path for backup logs
backup_logpath="/opt/meza/logs"
