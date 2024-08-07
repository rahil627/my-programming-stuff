#!/bin/bash
# this is the install script from the tutorial by DigitalOcean

set -euo pipefail

USERNAME=ra # TODO: Customize the sudo non-root username here

# Create user and immediately expire password to force a change on login
# TODO: groups sudo for debian, wheel for fedora/rhel
useradd --create-home --shell "/bin/bash" --groups wheel "${USERNAME}"
passwd --delete "${USERNAME}"
chage --lastday 0 "${USERNAME}"

# Create SSH directory for sudo user and move keys over
home_directory="$(eval echo ~${USERNAME})"
mkdir --parents "${home_directory}/.ssh"
cp /root/.ssh/authorized_keys "${home_directory}/.ssh"
chmod 0700 "${home_directory}/.ssh"
chmod 0600 "${home_directory}/.ssh/authorized_keys"
chown --recursive "${USERNAME}":"${USERNAME}" "${home_directory}/.ssh"

# Disable root SSH login with password
sed --in-place 's/^PermitRootLogin.*/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
if sshd -t -q; then systemctl restart sshd; fi
