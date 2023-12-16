# s5-bash-shell-script

## Working with Special Variables
**- $0:** This will return the script name 

**- $#:** How many command line parameters were passed to the script.

**- $@:** All the command line parameters passed to the script.

**- $?:** The exit status of the last process to run.

**- $$:** The Process ID (PID) of the current script.

**- $USER:** The username of the user executing the script.

**- $HOSTNAME:** The hostname of the computer running the script.

**- $SECONDS:** The number of seconds the script has been running for.

**- $LINENO:** Returns the current line number of the script.

## Example 1:
You want to see all of them in one script, don’t you? You can! Save the following as a text file called, `special.sh`
```sh
#!/bin/bash
echo "There were $# command line parameters or arguments"
echo "They are: $@"
echo "Parameter 1 is: $1"
echo "The script is called: $0"
pwd
echo "pwd returned $?" # to see the return code of the pwd command
echo "This script has Process ID $$"
echo "The script was started by $USER"
echo "It is running on $HOSTNAME"
sleep 3
echo "It has been running for $SECONDS seconds"
echo "This is line number $LINENO of the script"
```

Type the following to make it executable: `chmod +x special.sh`

**RESULT:**

```
[root@localhost tia]# ./special.sh alpha bravo charlie 56 2048 thursday
There were 6 command line parameters or arguments
They are: alpha bravo charlie 56 2048 thursday
Parameter 1 is: alpha
The script is called: ./special.sh
/home/tia
pwd returned 0
This script has Process ID 20403
The script was started by tia
It is running on localhost.localdomain
It has been running for 3 seconds
This is line number 15 of the script
[root@localhost tia]#
```

## Example 2:
```sh
#!/bin/bash
echo "With this script called $0, I will give you today's date"
echo "A date has actually $# portions: date of week; date of month; month; year"
echo -e "\t-The day of the week is: $1"
echo -e "\t-the day of the month is: $2"
echo -e "\t-the actual month is: $3"
echo -e "\t-the actual year is: $4"
```

**RESULT:**

```
[root@server1 ~]# ./script.sh Friday 3 April 2020
With this script called ./script.sh, I will give you today's date
A date has actually 4 portions: date of week; date of month; month; year
        -The day of the week is: Friday
        -the day of the month is: 3
        -the actual month is: April
        -the actual year is: 2020
[root@server1 ~]#
```