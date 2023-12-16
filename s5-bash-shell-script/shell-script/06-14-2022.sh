Color code with echo
We should always reset the color at the end of echo to turn off the color


# Reset
Color_Off='\033[0m'       # Text Reset
echo -e "[color][message][reset the color]"
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White


echo -e "
\033[1;36m

                *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=*
                *                    **** Warning ***                                      *
                *  This computer system is the private property of DevOps Easy Learning    *
                *  It is for authorized use only.                                          *
                *                                                                          *
                *  Unauthorized or improper use of this system may result in civil and     *
                *  criminal penalties and administrative or disciplinary action, as        *
                *  appropriate. By continuing to use this system you indicate your         *
                *  awareness of and consent to these terms and conditions of use. LOG OFF  *
                *  IMMEDIATELY if you do not agree to the conditions stated in this        *
                *  warning!!!!!                                                            *
                *  For support please contact support@devopseasylearning.com or call:      *
                *       Tia Leonard: 832 897 8630   OR   Eric Kemvou: 832 342 0700         *
                *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=*

\033[0m
"

echo -e "


                *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=*
                *                    **** Warning ***                                      *
                *  This computer system is the private property of DevOps Easy Learning    *
                *  It is for authorized use only.                                          *
                *                                                                          *
                *  Unauthorized or improper use of this system may result in civil and     *
                *  criminal penalties and administrative or disciplinary action, as        *
                *  appropriate. By continuing to use this system you indicate your         *
                *  awareness of and consent to these terms and conditions of use. LOG OFF  *
                *  IMMEDIATELY if you do not agree to the conditions stated in this        *
                *  warning!!!!!                                                            *
                *  For support please contact support@devopseasylearning.com or call:      *
                *       Tia Leonard: 832 897 8630   OR   Eric Kemvou: 832 342 0700         *
                *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=*
"

#!/bin/bash
KERNEL=`uname -r |awk -F. '{print $1}'`
MEMORY=`free -mh / |grep Mem: |awk '{print$2}'`
DISKUSAGE=`df -mh /  |tail -1 |awk '{print$2}'`
IP=`ifconfig |grep inet |head -1 |awk '{print$2}'`
NIC=`ifconfig |head -1 |awk -F: '{print$1}'`
SSH=`netstat -ltnp |grep  0.0.0.0:22 | awk '{print$4}' |awk -F: '{print$2}'`

echo -e "\033[1;31mBellow is the system inventory of server $IP\033[0m"
echo -e "\033[0;32mThe digit first of the kernel version is: $KERNEL\033[0m"
echo -e "\033[1;32mThe total size of the memory on this server is: $MEMORY\033[0m"
echo -e "\033[1;33mThe total size oof the disk available on this server: $DISKUSAGE\033[0m"
echo -e "\033[1;34mThe IP address of this server is: $IP\033[0m"
echo -e "\033[1;35mThe server NIC is: $NIC\033[0m"
echo -e "\033[1;36mThe SSH port on this server is: $SSH\033[0m"


## Sherbang
the bash path migth change base of Linux distro. The env remain the same on all Linux distro.
To avoid having errors with the interpreter, use the path of `env` then `bash` on your sherbang
```sh
#ON UBUNTU
which bash
#! /bin/bash

which env
#! /usr/bin/env

#REDHAT
which bash
#! /usr/bin/bash

which env
#! /usr/bin/env
```

```sh
#!/usr/bin/env bash


#! /bin/bash
echo "The DB password is: $PASSWORD"
echo "The DB user is: $USER"
echo "My default shell is: $SHELL"
echo "The user that is login is: $HOME"

export PASSWORD="password"
unset PASSWORD
