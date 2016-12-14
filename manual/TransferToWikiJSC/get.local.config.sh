#!/bin/sh
#
# Get config files from wiki.jsc.nasa.gov for new server

source /opt/meza/config/core/config.sh
source "$m_config/local/import-config.sh"

rm -f /opt/meza/config/local/LandingPage.php
copy_files="LandingPage.php more-extensions.php postLocalSettings_allWikis.php primewiki"
for copy_file in $copy_files; do
	echo
	echo "getting file $copy_file"
	rsync -avHe ssh "$remote_ssh_username@$remote_domain:/opt/meza/config/local/$copy_file" "/opt/meza/config/local/$copy_file"
done

#
# FILES BELOW: Local config files NOT required to be copied from production
#

# NOT required due to being basically the same as what is made by install.sh,
# but with the wrong database password (e.g. new server may have new password)
# preLocalSettings_allWikis.php

# NOT required due to re-running SAML setup script AFTER we adjust the IP
# addresses to point wiki.jsc.nasa.gov to this server
# saml20-idp-remote.php
# SAMLConfig.php
# saml-setup-config.sh
# simplesaml_authsources.php

# NOT required due to only changes from install process need to be done
# AFTER adjusting server IP addresses
# domain
# httpd

# NOT required because these were used to pull from other servers
# remote-wiki-config.sh
# local-import-config.backup.sh





# Might not be able to do this until SAML run
# sed -i "s/\/\/ \$mezaAuthType/\$mezaAuthType/" /opt/meza/config/local/preLocalSettings_allWikis.sh
