### What Are stdin, stdout, and stderr on Linux?
https://www.howtogeek.com/435903/what-are-stdin-stdout-and-stderr-on-linux/

These values are always used for stdin, stdout, and stderr:
- 0: stdin
- 1: stdout
- 2: stderr


### Redirecting stdout and stderr
To explicitly redirect  stdout, use this redirection instruction:

`1>`
To explicitly redirect  stderr, use this redirection instruction:

`2>`
Let’s try to our test again, and this time we’ll use 2>:

`./error.sh 2> capture.txt`

### Redirecting stdout and stderr to the Same File
`./error.sh > capture.txt 2>&1`

### https://stackoverflow.com/questions/10508843/what-is-dev-null-21
To have the output of a stream redirected and silently thrown away, direct the output to /dev/null.

```
0,1,2
0: standard input
1: standard output
2: standard error
>>
>> in command >> /dev/null 2>&1 appends the command output to /dev/null.

command >> /dev/null 2>&1
After command:
command
=> 1 output on the terminal screen
=> 2 output on the terminal screen
After redirect:
command >> /dev/null
=> 1 output to /dev/null
=> 2 output on the terminal screen
After /dev/null 2>&1
command >> /dev/null 2>&1
=> 1 output to /dev/null
=> 2 output is redirected to 1 which is now to /dev/null
```


## Command-line argument
use { } if your command line argument is =>10 or 2 digits or just user { } for all command argument


set -x
echo "$0"
echo "$1"
echo "$2"
echo "$3"
echo "${10}"

echo "The number command line arguments: $#"
echo "All command line arguments are: $*"
echo "All command line arguments are: $@"

#RESULT
./test.sh
tom
paul
john

The number command line arguments: 3
All command line arguments are: tom paul john
All command line arguments are: tom paul john
set -x
echo "{$0}"
echo "{$1}"
echo "{$2}"
echo "{$3}"
echo "${10}"

echo "The number command line arguments: $#"
echo "All command line arguments are: $*"
echo "All command line arguments are: $@"

#RESULT
./test.sh
tom
paul
john

The number command line arguments: 3
All command line arguments are: tom paul john
All command line arguments are: tom paul john




Color code with echo
We should always reset the color at the end of echo to turn off the color


# Reset
Color_Off='\033[0m'       # Text Reset
echo -e "[color][message][reset the color]
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
Example with color code

#!/bin/bash
KERNEL=`uname -r |awk -F. '{print $1}'`
MEMORY=`free -mh / |grep Mem: |awk '{print$2}'`
DISKUSAGE=`df -mh /  |tail -1 |awk '{print$2}'`
IP=`ifconfig |grep inet |head -1 |awk '{print$2}'`
NIC=`ifconfig |head -1 |awk -F: '{print$1}'`
SSH=`netstat -ltnp |grep  0.0.0.0:22 | awk '{print$4}' |awk -F: '{print$2}'`

echo -e "Bellow is the system inventory of server $IP \n"
echo "The digit first of the kernel version is: $KERNEL"
echo "The total size of the memory on this server is: $MEMORY"
echo "The total size oof the disk available on this server: $DISKUSAGE"
echo "The IP address of this server is: $IP"
echo "The server NIC is: $NIC"
echo "The SSH port on this server is: $SSH"

Thanks,
DevOps Team
EOF
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

echo -e "\033[1;95mThanks,\033[0m"
echo -e "\033[45mDevOps Team\033[0m"