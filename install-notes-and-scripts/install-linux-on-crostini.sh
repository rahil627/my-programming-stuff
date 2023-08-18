

https://wiki.archlinux.org/title/Chrome_OS_devices/Crostini
https://gist.github.com/baldrailers/09ba52a17219ca1e8fbf233dc8a4b375
  - BETTER THAN MY NOTES
  
https://chromium.googlesource.com/chromiumos/docs/+/master/containers_and_vms.md
  - some notes on running customer containers on chromeos


# TODO: note: in order to access files, must be named penguin?
# TODO: note: can have multiple containers, is it a chromeos beta only things?
#  - there's an experimental flag for it


# might have to stop if something went wrong...
vmc stop termina

# if it doesn't exist, it also creates it
vmc start termina
exit

# install arch
vmc container termina arch https://us.lxd.images.canonical.com/ archlinux/current
vmc container termina arch https://us.lxd.images.canonical.com/ archlinux/current --timeout 999999

vsh termina
lxc list
lxc arch


some edits:

add user:
useradd -m -G wheel ra
passwd ra

# enter arch container using bash, as root user
lxc exec arch -- bash

# enter arch container as a normal user
lxc console arch

# get crostini tools package
git clone https://aur.archlinux.org/cros-container-guest-tools-git.git
cd cros-container-guest-tools-git.git

cp -r /etc/skel/.config/pulse ~/.config

# TODO: note: ignore the write errors?

# maybe not...
# in case file-system is read-only
# https://askubuntu.com/questions/175739/how-do-i-remount-a-filesystem-as-read-write
# sudo mount -o remount,rw /dev/vda /opt/google/cros-containers




# if cannot install the default debian linux
vmc start
run_container.sh --container_name=penguin --user=ra --shell

chrome://net-internals/#dns

