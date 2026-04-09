#!/bin/bash
set -e

cd ~/
pacman -Syu pipewire-openrc pipewire-pulse-openrc wireplumber-openrc &&

Setup

##create runlevel by user ID (e.g. default UID is 1000, can check it bay "echo $UID")----

sudo mkdir /etc/runlevels/1000 &&

##Stack the run level----

sudo rc-update -s add default 1000 &&

##Add service to user runlevel----

sudo rc-update add pipewire 1000 &&

sudo rc-update add pipewire-pulse 1000 &&

sudo rc-update add wireplumber 1000 &&

##Append PAM to change runlevel after login----

#echo "session optional pam_exec.so /usr/local/bin/user-service-start" >> /etc/pam.d/system-local-login

#rc-update add -U pipewire default
#rc-update add -U pipewire-pulse default
#rc-update add -U woreplumber default
