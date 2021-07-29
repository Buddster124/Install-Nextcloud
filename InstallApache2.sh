#Apache Install Script
#Script Created By: Anthony Budd
#Last Edit Date: 07/29/2021

##Root Check
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

##Var Setting
    InstallType="Standard"

##Update and add Install Required Files
    echo "Getting Updates and Installing Required Files"
    apt-add-repository ppa:ondrej/php
    apt-add-repository ppa:ondrej/apache2
    add-apt-repository universe
    apt update -y && apt upgrade -y
    apt install apache2 mysql-server php7.4 libapache2-mod-php php-mysql php-gd php-apcu ffmpeg phpmyadmin php-mbstring php-gettext -y

##Enabling Apache Things
    echo "Enabling Apache Things"
    a2enmod rewrite
    a2enmod ssl

##Opening Ports 80 and 443
    echo "Opening Ports 80 & 443"
    ufw allow 80
    ufw allow 443

##Add Working Dir


##Download Needed Files



##Nextcloud Section
echo -n "Would You Like To Install Nextcloud (y/n)? "
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Installing Required Things For Nextcloud"
    InstallType="Nextcloud"
    apt install -y php7.4-zip php7.4-mbstring php7.4-xml php7.4-curl php7.4-intl php7.4-bcmath php7.4-gmp php7.4-imagick php7.4-gnupg -y
    a2enmod rewrite
    cd /home/$username/Desktop/
    echo "Downloading Setup Files"
    wget https://download.nextcloud.com/server/installer/setup-nextcloud.php
    echo "Making Nextcloud Working Dir"
    mkdir /var/www/Nextcloud/
    echo "Moving Setup Files"
    mv setup-nextcloud.php /var/www/Nextcloud/
    echo "Changing Permissions"
    chown -R www-data:www-data /var/www/Nextcloud/
    chmod -R 770 /var/www/Nextcloud/
    echo "Restarting Apache"
    service apache2 restart
    echo run the commmand sudo "mysql_secure_installation" to complete my sql install
    break
else
    echo "Finishing Up Things"
    InstallType="Standard"
    service apache2 restart
    echo run the commmand sudo "mysql_secure_installation" to complete my sql install
    break
fi

##Ending Message
    echo "Install Complete"
    echo "=================================================================================="
    echo "Install Details"
    echo "Install Type: $InstallType"
    echo "Ports Opened 80 & 443"
    echo "phpmyadmin Was installed to access the panel goto: http://localhost/phpmyadmin"
    if [$InstallType = "Nextcloud"]
    then
        echo "To finish the setup of nextcloud please navigate to: http://localhost/Nextcloud/setup-nextcloud.php"
    else
        echo "The Web Interface is: http://localhost/"
    fi

    

