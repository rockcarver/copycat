#/bin/sh

cr=`echo $'\n.'`
cr=${cr%.}


#DESIGN AREA FOR ALL MENUS

what_to_do_menu(){
clear
normal=`echo "\033[m"`
menu=`echo "\033[36m"` #Blue
number=`echo "\033[33m"` #yellow
bgred=`echo "\033[41m"`
fgred=`echo "\033[31m"`
printf "\n${normal}    WHAT SHALL WE DO TODAY ${normal}\n"
printf "\n"
printf "${menu}******************************************************* ${normal}\n"
printf "${menu}**${number} 1)${menu} Export Stuff ${normal}\n"
printf "${menu}**${number} 2)${menu} Import Stuff${normal}\n"
printf "${menu}**${number} 3)${menu} Play a Round of CopyCat${normal}\n"
printf "${menu}******************************************************* ${normal}\n"
printf "\n"
printf "Please select your preferred  # (or enter 'X' to exit. ${normal}"
read whattodo
direction=$(echo "$whattodo" | tr '.upper.]' '.lower.]')
}

env_export_menu() {
	clear
	normal=`echo "\033[m"`
	menu=`echo "\033[36m"` #Blue
	number=`echo "\033[33m"` #yellow
	bgred=`echo "\033[41m"`
	fgred=`echo "\033[31m"`
	printf "\n${normal}    ENVIRONMENT SELECTOR FOR EXPORT ${normal}\n"
	printf "\n"
	printf "${menu}******************************************************* ${normal}\n"
	printf "${menu}**${number} 1)${menu} Identity Cloud ${normal}\n"
	printf "${menu}**${number} 2)${menu} Catalyst ${normal}\n"
	printf "${menu}**${number} 3)${menu} Custom URL ${normal}\n"
	printf "${menu}******************************************************* ${normal}\n"
	printf "\n"
	printf "Please select your preferred  # (or enter 'X' to exit. ${normal}"
	read expselection
	newexpselection=$(echo "$expselection" | tr '.upper.]' '.lower.]')
}

env_import_menu() {
	clear
	normal=`echo "\033[m"`
	menu=`echo "\033[36m"` #Blue
	number=`echo "\033[33m"` #yellow
	bgred=`echo "\033[41m"`
	fgred=`echo "\033[31m"`
	printf "\n${normal}    ENVIRONMENT SELECTOR FOR IMPORT ${normal}\n"
	printf "\n"
	printf "${menu}******************************************************* ${normal}\n"
	printf "${menu}**${number} 1)${menu} Identity Cloud ${normal}\n"
	printf "${menu}**${number} 2)${menu} Catalyst ${normal}\n"
	printf "${menu}**${number} 3)${menu} Custom URL ${normal}\n"
	printf "${menu}******************************************************* ${normal}\n"
	printf "\n"
	printf "Please select your preferred  # (or enter 'X' to exit. ${normal}"
	read impselection
	newimpselection=$(echo "$impselection" | tr '.upper.]' '.lower.]')
}


show_menu() {
	clear
	normal=`echo "\033[m"`
	menu=`echo "\033[36m"` #Blue
	number=`echo "\033[33m"` #yellow
	bgred=`echo "\033[41m"`
	fgred=`echo "\033[31m"`
	printf "\n${normal}      ENVIRONMENTAL DATA SELECT ${normal}\n"
	printf "\n"
	printf "${menu}******************************************************* ${normal}\n"
	printf "${menu}**${number} 1)${menu} Journeys Only ${normal}\n"
	printf "${menu}**${number} 2)${menu} Scripts Only ${normal}\n"
	printf "${menu}**${number} 3)${menu} Themes Only ${normal}\n"
	printf "${menu}**${number} 4)${menu} eMail Templates Only ${normal}\n"
	printf "${menu}**${number} 5)${menu} Applications Only ${normal}\n"
	printf "${menu}**${number} 6)${menu} Social Providers Only ${normal}\n"
	printf "${menu}**${number} 7)${menu} Circles of Trust Only ${normal}\n"
	printf "${menu}**${number} 8)${menu} IDM Configuration Only ${normal}\n"
	printf "${menu}**${number} 10)${menu} The Whole Smash (all of the above) ${normal}\n"
	printf "\n"
	printf "${menu}**${number} M)${menu} Return to Main Menu ${normal}\n"
	printf "${menu}******************************************************* ${normal}\n"
	printf "\n"
	printf "Please select your preferred  # (or enter 'X' to exit). ${normal}"
	read opt
	echo "\n"
	opt=$(echo "$opt" | tr '.upper.]' '.lower.]')
        if [ $opt = 'm' ]
		then
        	what_to_do_menu
	fi

	if [ $opt = 'x' ]
        	then
       		exit;
	fi
}

# ROUTINES

export_all_journey() {
fname='allJourneys.json'
frodo journey export -A $source $realm $user $pass
frodo journey export -a -f ../master/$fname $source $realm $user $pass
}

export_all_script() {
fname='allScripts.json'
frodo script export -A $source $realm $user $pass
frodo script export -a -f ../master/$fname $source $realm $user $pass
}

export_all_theme() {
fname='allThemes.json'
frodo theme export -A $source $realm $user $pass
frodo theme export -a -f ../master/$fname $source $realm $user $pass
}

export_all_template() {
fname='allTemplates.json'
frodo email template export -A $source $realm $user $pass
frodo email template export -a -f ../master/$fname $source $realm $user $pass
}

export_all_application() {
fname='allApplications.json'
frodo application export -A $source $realm $user $pass
frodo application export -a -f ../master/$fname $source $realm $user $pass
}

export_all_social() {
fname='allIDP.json'
frodo idp export -A $source $realm $user $pass
frodo idp export -a -f ../master/$fname $source $realm $user $pass
}

export_all_idm() {
fname='allIDM.json'
frodo idm export -A -D idm/ $source $realm $user $pass
# frodo idm export -a -D master/ -f master/$fname $source $realm $user $pass
}

export_all_cot() {
fname='allSAML.json'
frodo saml export -A $source $realm $user $pass
frodo saml export -a -f ../master/$fname $source $realm $user $pass
}

import_all_journey() {
cd master
frodo journey import -a -f allJourneys.json $target $realm $user $pass
cd ..
}

import_all_script() {
cd master
frodo script import -f allScripts.json $target $realm $user $pass
cd ..
}

import_all_theme() {
cd master
frodo theme import -a -f allThemes.json $target $realm $user $pass
cd ..
}

import_all_template() {
cd master
frodo email template import -a -f allTemplates.json $target $realm $user $pass
cd ..
}

import_all_application() {
cd master
frodo application import -a -f allApplications.json $target $realm $user $pass
cd ..
}

import_all_social() {
cd master
frodo idp import -a -f allIDP.json $target $realm $user $pass
cd ..
}

import_all_idm() {
cd master
frodo idm importAll $target $realm $user $pass
cd ..
}

import_all_cot() {
cd master
frodo saml import -a -f allSAML.json $target $realm $user $pass
cd ..
}

check_to_build() {
if [ ! -f "$file" ]
	then
	build_directory_structure
fi
}

required_structure() {
if [ ! -f "$file" ]
        then
        printf "I'm sorry, but your source directory structure appears to be ${bgred}MISSING!${normal}"
	read -p "$cr Please hit <enter> to return to the main menu."
fi
}

build_directory_structure() {
mkdir $namespace
cd $namespace
mkdir master
mkdir journey
mkdir script
mkdir theme
mkdir social
mkdir cot
mkdir template
mkdir application
mkdir idm
cd ..
touch ~/$namespace.dir
}

source_selector() {
echo "\n"
read -p  "Enter your source namespace: " namespace
echo "\n"
read -p "What is your source admin username: " user
echo "\n"
read -s -p  "What is your source admin password: " pass

if [ $newexpselection = '1' ]
	then
	realm='/alpha'
	source='https://openam-'$namespace'.forgeblocks.com/am'
fi

if [ $newexpselection = '2' ]
	then
	realm='/'
	source="https://$namespace.catalyst.forgerock.org/am"
fi
}

target_selector() {
echo "\n"
read -p "Do the source and target environments have the same name? (y/n) " samesame
newsamesame=$(echo "$samesame" | tr '.upper.]' '.lower.]')

if [ $newsamesame = 'y' ]
	then
	echo "\n"
	read -p  "Enter your target namespace: " tnamespace
	file=~/$tnamespace.dir
	namespace=$tnamespace
	required_structure
	echo "\n"
	read -p "What is your target admin username: " user
	echo "\n"
	read -s -p  "What is your target admin password: " pass
fi

if [ $newsamesame = 'n' ]
	then
		echo "\n"
		read -p  "What is the namespace of the source your data came from?: " namespace
		echo "\n"
		read -p  "Enter your target namespace: " tnamespace
		file=~/$namespace.dir
		namespace=$namespace
		required_structure
		echo "\n"
		read -p "What is your target admin username: " user
		echo "\n"
		read -s -p  "What is your target admin password: " pass
fi

if [ $newimpselection = '1' ]
	then
	realm="/alpha"
	target="https://openam-$tnamespace.forgeblocks.com/am"
fi

if [ $newimpselection = '2' ]
	then
	realm="/"
	target="https://$tnamespace.catalyst.forgerock.org/am"
fi
}

custom_target_selector() {
echo "\n"
read -p  "Enter the full target URL (including '/am'): " targetURL
echo "\n"
read -p "What namespace contains your source files?: " cnamespace
file=~/$cnamespace.dir
namespace=$cnamespace
required_structure
echo "\n"
read -p "What is your admin username: " user
echo "\n"
read -s -p  "What is your admin password: " pass

	realm='/'
	target=$targetURL
}

custom_source_selector() {
echo "\n"
read -p  "Enter the full target URL (including '/am'): " targetURL
org="$targetURL\n"
firstparse=${org#*https://}
secondparse=$(echo $firstparse | cut -d"." -f1)
file=~/$secondparse.dir
namespace=$secondparse
echo "\n"
read -p "What is your admin username: " user
echo "\n"
read -s -p  "What is your admin password: " pass

	realm='/'
	source=$targetURL
}

fix_stuff_for_import() {
	echo "\n\n Please hold while we prepare your source files for import..."
	old=$namespace
	new=$tnamespace
	cd $namespace
	cp -R master master-org
	cd master
	find ./ -type f -exec sed -i '' "s/$old/$new/g" {} \;
	cd ../../
	echo "\n"
	read -p "$cr Modifications complete...$nummods changes made. Hit <Return> to start the Import process." a
}

# Export Option Function
get_export_option() {
if [ $opt = '1' ]
	then
	cd $namespace/journey
	export_all_journey
	echo "\n\n"
	echo "All Journeys have been exported into separate files under ${menu}$namespace/journey${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master ${normal}."
	read -p "$cr Press <return> to continue. " a
	clear
	cd ../../
	show_menu
	get_export_option
fi

if [ $opt = '2' ]
	then
	cd $namespace/script
	export_all_script
	echo "\n\n"
	echo "All Scripts have been exported into separate files under ${menu}$namespace/script${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        cd ../../
	clear
        show_menu
				get_export_option
fi

if [ $opt = '3' ]
	then
	cd $namespace/theme
	export_all_theme
	echo "\n\n"
	echo "All Themes have been exported into separate files under ${menu}$namespace/theme${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        cd ../../
	clear
        show_menu
				get_export_option
fi

if [ $opt = '4' ]
	then
	cd $namespace/template
	export_all_template
	echo "\n\n"
	echo "All Email Templates have been exported into separate files under ${menu}$namespace/template${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        clear
	cd ../../
        show_menu
				get_export_option
fi

if [ $opt = '5' ]
	then
	cd $namespace/application
	export_all_application
	echo "\n\n"
	echo "All Applications have been exported into separate files under ${menu}$namespace/application${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        cd ../../
	clear
        show_menu
				get_export_option
fi


if [ $opt = '6' ]
	then
	cd $namespace/social
	export_all_social
	echo "\n\n"
	echo "All Social Providers have been exported into separate files under ${menu}$namespace/social${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        cd ../../
	clear
        show_menu
				get_export_option
fi

if [ $opt = '7' ]
	then
	cd $namespace/cot
	export_all_cot
	echo "\n\n"
	echo "All Circles of Trust have been exported into separate files under ${menu}$namespace/cot${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        cd ../../
	clear
        show_menu
				get_export_option
fi

if [ $opt = '8' ]
	then
	cd $namespace
	export_all_idm
	echo "\n\n"
	echo "All IDM Configurations have been exported into separate files under ${menu}$namespace/idm${normal}."
	echo "\n"
	echo "As an added bonus, a single file containing ALL of the above, is under ${menu}$namespace/master/$fname${normal}."
	read -p "$cr Press <return> to continue. " a
        cd ../
	clear
        show_menu
				get_export_option
fi

if [ $opt = '10' ]
	then
	cd $namespace
	cd journey
	export_all_journey
	cd ../script
	export_all_script
	cd ../theme
	export_all_theme
	cd ../template
	export_all_template
	cd ../application
	export_all_application
	cd ../social
	export_all_social
	cd ../cot
	export_all_cot
	cd ../
	export_all_idm
	echo "\n\n"
	echo "All configurations have been successfully exported and placed into their own respective directory under ${menu}$namespace ${normal} (by category). "
	printf "${menu}Example:  $namespace\journey ${normal}\n"
	echo "\nEach export contains individual files."
	echo "\n"
	echo "As an added bonus, a single file containing EACH CATEGORY of the above, is under ${menu}$namespace/master ${normal}."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_export_option
fi
}

get_import_option() {

cd $namespace

if [ $opt = '1' ]
	then
	import_all_journey
	echo "\n\n"
	echo "All Journeys have been imported."
	read -p "$cr Press <return> to continue. " a
		clear
		show_menu
		get_import_option
fi

if [ $opt = '2' ]
	then
	echo "\n\n"
	import_all_script
	echo "All Scripts have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi

if [ $opt = '3' ]
	then
	echo "\n\n"
	import_all_theme
	echo "All Themes have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi

if [ $opt = '4' ]
	then
	echo "\n\n"
	import_all_template
	echo "All Email Templates have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi

if [ $opt = '5' ]
	then
	echo "\n\n"
	import_all_application
	echo "All Applications have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi


if [ $opt = '6' ]
	then
	echo "\n\n"
	import_all_social
	echo "All Social Providers have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi

if [ $opt = '7' ]
	then
	echo "\n\n"
	import_all_cot
	echo "All Circles of Trust have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi

if [ $opt = '8' ]
	then
	echo "\n\n"
	import_all_idm
	echo "All IDM Configurations have been imported."
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi

if [ $opt = '10' ]
	then
	import_all_theme
	import_all_template
	import_all_social
	import_all_journey
	import_all_script
	#import_all_idm
	echo "\n\n"
	echo "All configurations have been successfully imported. "
	printf "${menu}Exampl.  $tnamespace\journey ${normal}\n"
	read -p "$cr Press <return> to continue. " a
        clear
        show_menu
				get_import_option
fi
}

# RUN PROGRAM
what_to_do_menu

if [ $direction = '1' ]
  then
  env_export_menu

	if [ $newexpselection = '3' ]
		then
			custom_source_selector
		else
  	source_selector
  	file=~/$namespace.dir
	fi
  check_to_build
  show_menu
  get_export_option
fi

if [ $direction = '2' ]
  then
  env_import_menu

	if [ $newimpselection = '1' ]
		then
		target_selector
		if [ $newsamesame = 'n' ]
				then
				fix_stuff_for_import
		fi
		show_menu
		get_import_option
	fi

	if [ $newimpselection = '2' ]
		then
		target_selector
		if [ $newsamesame = 'n' ]
				then
				fix_stuff_for_import
		fi
		show_menu
		get_import_option
	fi

	if [ $newimpselection = '3' ]
		then
		custom_target_selector
		if [ $newsamesame = 'n' ]
				then
				fix_stuff_for_import
		fi
		show_menu
		get_import_option
	fi

fi
