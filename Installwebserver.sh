#Installs Apache2 and php with modules for mysql
apt-add-repository ppa:ondrej/php
apt-add-repository ppa:ondrej/apache2
add-apt-repository universe
apt install apache2 -y
apt install mysql-server -y
apt install php7.4 libapache2-mod-php -y
apt install php-mysql php-gd -y
apt install php-apcu -y
sudo apt install ffmpeg -y
apt install phpmyadmin php-mbstring php-gettext -y
a2enmod rewrite
a2enmod ssl
ufw allow 80
ufw allow 443
cd /home/anthony/Desktop/
wget https://download.nextcloud.com/server/installer/setup-nextcloud.php
mkdir /var/www/Nextcloud/
mv setup-nextcloud.php /var/www/Nextcloud/
apt install -y php7.4-zip php7.4-mbstring php7.4-xml php7.4-curl php7.4-intl php7.4-bcmath php7.4-gmp php7.4-imagick php7.4-gnupg
chown -R www-data:www-data /var/www/Nextcloud/
chmod -R 770 /var/www/Nextcloud/
a2enmod rewrite
service apache2 restart
echo run the commmand sudo "mysql_secure_installation" to complete my sql install