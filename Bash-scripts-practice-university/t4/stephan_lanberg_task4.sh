if ! [ -x "$(command -v git)" ];
then
	echo "Git not installed, let me fix it"
	sudo apt install git -y
fi

installationPlace=~/Desktop/cowsay/

if [ -d ~/Desktop ]
then
	git clone https://github.com/nuwanarti/cowsay.git ~/Desktop/cowsay
	if [ $? -ne 0 ]
	then
	  echo "Error with github repository, check the link for more info https://github.com/nuwanarti/cowsay.git"
		exit 1
	fi
else
	echo "Desktop doesn't exist"
	read -rp "Do you want to clone repository \"Cowsay\"
	in your current directory? [y/N]" actionPrompt
	case $actionPrompt in
		[yY])
		installationPlace=./cowsay/
		git clone https://github.com/nuwanarti/cowsay.git
		if [ $? -ne 0 ]
		then
			exit 1
		fi;;
	*)
		echo "Ok bye"
		exit 1;;
	esac
fi

chmod +x "$installationPlace"{cowsay,cowthink}

sed -i '/^alias cowthink=/d; /^alias cowsay=/d' ~/.bashrc

echo "alias cowsay='cowsay ThankYou. Eat The Rich. Omae wa mou shindeiru.'" >> ~/.bashrc
echo "alias cowthink='cowthink ThankYou. Eat The Rich. Omae wa mou shindeiru.'" >> ~/.bashrc
source ~/.bashrc

cowsay -h
echo "Script made alias for \"cowsay\". Close your current terminal and open new terminal then type in new terminal: cowsay"
