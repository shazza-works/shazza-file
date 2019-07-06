#!/data/data/com.termux/files/usr/bin/bash
# Shazza-Works 🐂🐂🐂
# Simple Wrapper for the 'openSSL'
# Made to encrypt files in the tree easy with
# choice of algos to use
# 'V1.0'
## >>>>> THIS IS FOR ARM - 'ANDROID' <<<<<
#
# Do CHECK FOR OPENSSL MAY NOT BE INSTALLED? SE WHAT SIZE IT IS AS WELL +++
# +++++++
#
#
#		NO ZENITY ON DROID CHANGE
#	TERMUX to use '$PREFIX' == '/data/data/com.termux/files/usr'
#				just add 'BIN'
#

#### ARE WE 'ANDROID' ####
if [ $(uname -o) = "Android" ]; then
	echo
else
	clear
	echo -e "\n\\n\n\t\t\t!! [ERROR: THIS Shazza-File WAS MADE FOR ANDROID] !!"
	echo -e "\t\t\t\tRUN GNU/Linux Shazza-File ON HERE THANKS\n\n\n"
	exit
fi

if [[ $1 == "--remove" ]]; then
	rm -rf $PREFIX/bin/shazzafile
	echo -e "\t\t\n Shazza-File Has Now Been REMOVED!"
	echo -e "\nEnter..."
	read -r
	exit
fi

if [[ $1 == "--install" ]]; then
	cp shazzafile $PREFIX/bin/
	less -e  README.md
	echo -e "\t\t\n Now Installed just use with (shazzafile) from the shell"
	echo -e "\nEnter..."
	read -r
fi

# - ### ZEN IS GONE ####

if [ ! -e $PREFIX/bin/openssl ]; then
	echo -e "\t\t\n\nSetting Up...OpenSSL\n\t\t Please Wait...\n"
	sleep 3
	apt install openssl --y
fi

# - # clear

#__colour__
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
bluef='\e[1;34m'
orange='\e[38;5;166m'
rs="\033[00m"

echo -e "\t\t$red					 "
echo -e "\t\t                 .,;;,.                 "
echo -e "\t\t           'cxKNMMMMMMMMN0xc.           "
echo -e "\t\t        ;kWMMMMMMMMMMMMMMMMMMWk;        "
echo -e "\t\t      oWMMMXOkxxk0XMMN0kkxkOXMMMNo      "
echo -e "\t\t    cWMWxc''',,,,'.cl.',,,,'''cxWMN:    "
echo -e "\t\t   OMMd'',,,,,,,'oNMMWd',,,,,,,''dWMk   "
echo -e "\t\t  0MM:',,,,,,,,.0MMMMMMK',,,,,,,,';WMO  "
echo -e "\t\t oMMx.,,,,,,,,'dMNK00KNMk.,,,,,,,,'dMMl "
echo -e "\t\t WMMc,,,,,,,,'.,'.''''.';.',,,,,,,,:MMN "
echo -e "\t\t'MMMd.,,,,,'cKK.,,,,,,,,.OKc',,,,,'oMMM."
echo -e "\t\t'MMMW;',,,.kMMMl        cMMMO',,,',WMMM."
echo -e "\t\t WMMMWl',.dMMMMMd'',,''dMMMMMx.,'cNMMMN "
echo -e "\t\t oMMMMMXo.0MMMMMMNo..oNMMMMMMK.lKMMMMMc "
echo -e "\t\t  0MMMMMMd.';:cc:;'''';:ccc;'.dMMMMMMk  "
echo -e "\t\t   kMMMMMW,',,,,,,,,,,,,,,,,''WMMMMMx   "
echo -e "\t\t    :NMMMMN:',,,,,,,,,,,,,,';NMMMMN;    "
echo -e "\t\t      lNMMMMO:'',,,,,,,,'':OMMMMXc      "
echo -e "\t\t        ,xNMMMWOdlc::cldONMMMNx,        "
echo -e "\t\t           .:dOXWMMMMMMWXOd:.           "
echo -e "\t\t                 ..''..                 "
echo -e "\t\t                              "$cyan"Shazza-Works__V0.1__4>_TERMUX$rs"

sleep 2

function allinfo {
echo -e "$orange\n\t\t ⛑  N.B. When doing$yellow ALL_FILES$orange in the PWD there are a few things to note...!
        \tALL files WILL be encrypted with the selected password and this will also recurse
        \tinto any dirs and will encrypt all the files inside but not calling script (this program)
        \t You dont need to worry about rename or it being in the PWD as .sh.....    ⛑\n
        \t << Note__You Will Be Asked 2x For Pass -- Pls Don't Forget As No Way Back And Not My Fault!!! >>$rs"
}

function block {
echo -e "$yellow\n\t 🔀 Choose Your Encryption>\n\n$orange"
select a in `echo "-aes-128-cbc -aes-192-cbc -aes-256-cbc -aes128 -aes192 -aes256 -aria-128-cbc -aria-192-cbc -aria-256-cbc -aria128 -aria192 -aria256 -bf-cbc -blowfish
                -camellia-128-cbc -camellia-192-cbc -camellia-256-cbc -camellia128 -camellia192 -camellia256 -cast-cbc -cast5-cbc -des-cbc -des-ede-cbc -des-ede3-cbc -des3
                -desx-cbc -rc2-128 -rc2-64-cbc -rc2-cbc -rc4 -seed-cbc -sm4-cbc"`; do
                echo -e "\n\tUsing Cipher>$rs $a\n" # Using what Cipher
		break
done
}

function encrypt {
echo
read -s -p "What Password To Use?" secret # ADD A PASS CHECK !!!
echo
read -s -p "Re~Enter" sure
if [ $secret = $sure ]; then
	echo -e "\n"
	for d in ${num}; do
		if [ -f $d ] && [ ! $d = $0 ]; then # IF IS FILE AND NOT THIS SCRIPT
			openssl enc $encs $a -pbkdf2 -k $secret -in ${d} -out $d'.shazza'
			if [ $? = 0 ]; then
				echo -e "\t🔐--> LOCKED> $d"
				shred -n 3 -u $d
			else
				echo -e "\t⛔--> ERROR!> $d"
			fi
		fi
	done
else
	echo -e "\n\tPASSWORD MISSMATCH!!\n\n\t\tTAKE CARE WHEN ENTER PASSWORD!\n"
        echo -e "\t\t\t\tLOSS OF PASS == LOSS OF DATA !!!!\n"
fi
}

function decrypt {
echo
read -s -p "What Password To Use?" secret # ADD A PASS CHECK !!!
echo
read -s -p "Re~Enter" sure
if [ $secret = $sure ]; then
	echo -e "\n"
	for d in ${num}; do
		if [ -f $d ] && [ ! $d = $0 ]; then
			if [ ${d: -7} == ".shazza" ]; then
				string=$d
				suffix='.shazza'
				out=${string%"$suffix"}
				openssl enc $denc $a -pbkdf2 -k $secret -in ${d} -out $out
				if [ $? = 0 ]; then
					echo -e "\t✅--> UN_LOCKED> $d"
					shred -n 3 -u $d
				else
					echo -e "\t⛔--> ERROR!> $d"
				fi
			else
				echo -e "\t⛔--> File Was Not Encrypted> $d"
			fi
		fi
	done
else
	echo -e "\n\tPASSWORD MISSMATCH!!\n\t\tTAKE CARE WHEN ENTER PASSWORD!\n"
	echo -e "\t\t\t\tLOSS OF PASS == LOSS OF DATA !!!!\n"
fi
}

function start {
echo -e "$yellow\n\tSelect You Task...\n$rs"
select b in "Encrypt" "Decrypt"; do
	if [[ $b =  "Encrypt" ]]; then
		block
		select g in "Single_File" "All_Files"; do
        		if [[ $g = "Single_File" ]]; then
				encs='-e'
                		select x in $(realpath `ls`); do num=$x; break; done
				encrypt
				break
			elif [[ $g = "All_Files" ]]; then
				num=`tree -ifR | tail -n +2 | head -n -2`
				encs='-e'
				allinfo
				encrypt
				break
			else
				echo -e "\n\tTry Again!\n"
			fi
		done

	elif [[ $b = "Decrypt" ]]; then
		block
                select g in "Single_File" "All_Files" "Exit"; do
			if [[ $g = "Single_File" ]]; then
				denc='-d'
				select x in $(realpath `ls`); do num=$x; break; done
				decrypt
				break
			elif [[ $g = "All_Files" ]]; then
				num=`tree -ifR | tail -n +2 | head -n -2`
				denc='-d'
				allinfo
				decrypt
				break
			elif [[ $g = "Exit" ]]; then
				exit
			else
				echo -e "\n\tTry Again!\n"
			fi
		done
	else
		echo -e "\n\tTry Again!\n"
	fi
done
}

## MAIN ##
start
