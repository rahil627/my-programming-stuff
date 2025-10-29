
# WARNING: NOTE: don't do this again.. it's flaky, not worth messing with. also, the default distro Debian works perfectly fine.
#   - often-times the container wouldn't be recognized by the vm (lxc), requiring one to restart the vm several times. Then, often-times, the chrome terminal app wouldn't work..

# if you do, trying re-using the default container name: penguin
#   - the vm/lxc setup seems to be hard-coded to use that name, even if you change it, leaving the container that was originally labeled penguin in limbo

https://wiki.archlinux.org/title/Chrome_OS_devices/Crostini
  - main article to follow
  - TODO: update this

https://gist.github.com/baldrailers/09ba52a17219ca1e8fbf233dc8a4b375
  - BETTER THAN MY NOTES

https://shibumi.dev/posts/install-arch-linux-on-chromeos/
  - most of the info is in the arch-wiki

https://github.com/edeloya/ChromeOS-Terminal-LXC-LXD
  - TODO: can hook up a container to penguin?



https://www.reddit.com/r/Crostini/wiki/index/
  - reddit has a wiki!?

https://chromium.googlesource.com/chromiumos/docs/+/master/containers_and_vms.md
  - some notes on running customer containers on chromeos

https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools/sommelier/README.md
  - sommelier readme
  - Sommelier - Nested Wayland compositor with support for X11 forwarding
  - Sommelier is an implementation of a Wayland compositor that delegates compositing to a ‘host’ compositor. Sommelier includes a set of features that allows it to run inside a tight jail or virtual machine.
  - Sommelier can run as service or as a wrapper around the execution of a program. As a service, called the parent sommelier, it spawns new processes as needed to service clients.


# TODO: note: in order to access files, must be named penguin?
# TODO: note: can have multiple containers, is it a chromeos beta only things?
#  - there's an experimental flag for it

# c+a+t to open chromeos's "crosh" terminal

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
lxc arch # WARNING: changed to back to default "penguin" after some chromeos updates, or something like that



# enter arch container using bash, as root user
lxc exec arch -- bash

# enter arch container as a normal user
lxc console arch
# press enter afterwards


# update mirrors for pacman?
# pacman -S reflector
# sudo reflector -n 100 --sort score -c US --save /etc/pacman.d/mirrorlist


pacman -S yay

# get crostini tools package (varies by linux distro)
# from a temp downloads folder
# git clone https://aur.archlinux.org/cros-container-guest-tools-git.git
# cd cros-container-guest-tools-git.git
# TODO: use yay instead

cp -r /etc/skel/.config/pulse ~/.config

# TODO: note: ignore the write errors?



# some edits:

# chrome beta allows multiple containers
# TODO: however, the chromeos terminal window still lists the initial old containers
# in order to link the chromeos files app to linux, i think the container must be named penguin 

# if no user was generated
add user:
useradd -m -G wheel ra
passwd ra

# choose one to uncomment in 'visudo' command:
# enter password everytime you sudo, or not?
# %wheel ALL=(ALL) ALL
# %wheel ALL=(ALL) NOPASSWD: ALL


# if network probs
# https://wiki.archlinux.org/title/Chrome_OS_devices/Crostini#No_network_in_container
pacman -S dhclient
dhcpcd eth0
systemctl disable systemd-networkd
systemctl disable systemd-resolved
unlink /etc/resolv.conf
touch /etc/resolv.conf
systemctl enable dhclient@eth0
systemctl start dhclient@eth0

# if the gui is blurry
# https://www.reddit.com/r/Crostini/wiki/howto/adjust-display-scaling/
# see the chromiumos docs on sommelier for more info
# -X for X11 clients
# example:
sommelier -X --scale=0.75 --dpi=120 inkscape
sommelier -X --scale=0.8 --dpi=160 /usr/share/code/code "--unity-launch %F" &

# add flags to the app shortcut
# in usr/share/applications/app.desktop update the 'Exec=...' line(s)
Exec=sommelier -X --scale=0.8 --dpi=160 /usr/share/code/code "--unity-launch %F"`
Exec=sommelier -X --scale=0.8 --dpi=160 /usr/share/code/code "--new-window %F"    



# in case you want to keep certain key-bindings handled by chromeos
sommelier --accelerators="<Alt>Bracketright,<Alt>Bracketleft" gedit




# when installing gui apps, it might ask you a choice about xdg-desktop-portal backends
# i selected xdg-desktop-portal-wlr because *i think* crostini/chromeos uses wayland 


# maybe not...
# in case file-system is read-only
# https://askubuntu.com/questions/175739/how-do-i-remount-a-filesystem-as-read-write
# sudo mount -o remount,rw /dev/vda /opt/google/cros-containers




# if cannot install the default debian linux, can install manually
vmc start termina
vmc container termina penguin
# deprecated
# should be in usr/bin/run_container.sh
#run_container.sh --container_name=penguin --user=ra --shell

chrome://net-internals/#dns

