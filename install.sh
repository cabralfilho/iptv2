#!/bin/bash
#
# edited by Iryadinata
# Web: https://irtech.net
# GitHub: https://github.com/irtec/
#

apt-get update && apt-get upgrade -y
apt-get install lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip -y && apt-get install php5-mcrypt &&  php5enmod mcrypt
service apache2 restart
wget https://sourceforge.net/projects/restream/files/www_dir.tar.gz -O /tmp/www_dir.tar.gz
#
if [ -d /var/www/html ];
then
    echo "/var/www/html/ exists."
	tar -zxvf /tmp/www_dir.tar.gz -C /var/www/html/
else
    echo " "
	if [ -d /root/www/ ];
	then
    echo "/var/www/ exist"
    	tar -zxvf /tmp/www_dir.tar.gz -C /var/www/
else
    echo "No Webserver installed?"

fi

fi
#
wget http://127.0.0.1/downloads/iptv_panel_pro.zip -O /tmp/iptv_panel_pro.zip
wget http://127.0.0.1/downloads/install_iptv_pro.zip && unzip install_iptv_pro.zip
#
php install_iptv_pro.php
#
echo " "
echo "####################################################################################"
echo " "
echo "Lisensi sekarang diinstal untuk menerima kedua pertanyaan dengan YES !!!"
echo " "
echo 1 > /proc/sys/net/ipv4/ip_forward
#
/sbin/iptables -t nat -I OUTPUT --dest 149.202.206.51/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 123.103.255.80/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 62.210.244.112/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 185.73.239.0/28 -j DNAT --to-destination 127.0.0.1
#
apt-get install iptables-persistent
#
echo " "
echo "####################################################################################"
echo " "
echo "Installationsdateien werden entfernt"
echo " "
rm /root/install_iptv_pro.php
rm /root/install_iptv_pro.zip
rm /root/xt_1.0.60-inst.sh
echo " "
echo "####################################################################################"
echo " "
echo "Xtream Codes 1.0.60 edited by maxdata755 public Version"
echo "Support by Iryadinata Pangkalanbun"
echo " "
echo "Instalasi selesai..."
echo " "
echo "Server sekarang harus direstart !!!"
echo " "
      read -p "Reboot now (y/n)?" CONT
      if [ "$CONT" == "y" ] || [ "$CONT" == "Y" ]; then
      reboot
      fi
