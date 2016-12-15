README
======

Setup
-----

1. Run `install.sh` on `remote-backup-simplify` branch. Test on Demo Wiki to verify basic functionality (just cuz).
2. Put `import-config.sh` into `/opt/meza/config/local/import-config.sh` then edit it accordingly. It has some directions at the top.
  1. Make sure to remove the `exit 1` command at the top of this file which will prevent running the backup. See the directions in the file.
3. Create a user with SSH keys to be able to pull info from SOURCE to BACKUP. On your SOURCE and BACKUP servers, run the appropriate parts of `setup.ssh.users.sh`. DO NOT attempt to `sudo bash ...` this file. Run it line by line, just the parts you need. If you're importing from two test servers you'll need to do everything, probably. If you're sourcing from wiki.jsc.nasa.gov to your own VM there are several parts I've already done. If you're sourcing from wiki.jsc.nasa.gov to the **NEW** wiki.jsc.nasa.gov, this can be skipped (I've completed it).
4. For testing you'll either need to change `$mezaAuthType` in each wiki's config (`..../wikis/<wikiId>/config/preLocalSettings.php`) to something like 'anon-edit', or set a password for your user.
5. If you want to speed up import for testing purposes, you may want to disable rebuildData and search-indexing in `import-config.sh`.


Do backups
----------

1. Run `sudo bash /opt/meza/scripts/backup-and-import.sh`.
2. Run `get.local.config.sh` to grab local config files from wiki.jsc's `/opt/meza/config/local` directory.
  1. You'll need to go into `config/local/postLocalSettings_allWikis.php` and disable SAML authentication. Just put a `false && ` at the beginning of the if-statement so it never enter it.
3. Run `sudo bash /opt/meza/scripts/updateExtensions.sh` to update any extensions added from wiki.jsc local config.


Stuff we'll need to do after we actually are wiki.jsc
-----------------------------------------------------

1. Setup SAML/LaunchPad
2. Adjust `$mezaAuthType`
3. Turn on email
