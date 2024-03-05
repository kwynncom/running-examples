# local dev working version 2024/03/04 22:44


ServerAdmin buessresume@gmail.com

Include sites-available/nup/nuprw.inc

<VirtualHost *:80>

	ServerName ${Gsn}

	RewriteEngine On
	RewriteRule ^ https://${Gsn}%{REQUEST_URI} [L,NE]
</VirtualHost>

<VirtualHost *:443>
	ServerName ${Gsn}
	Include sites-available/common/pubssl.inc
	Include sites-available/common/pubalias.inc
	RewriteRule /graphics/menubaritem_submenuindicator_selected.png https://${Gsn}/t/8/02/pacer/menubaritem_submenuindicator_selected.png

</VirtualHost>

LogFormat "%h %l %u %t %{usec_frac}t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" micro
CustomLog ${APACHE_LOG_DIR}/access.log micro
ErrorLog  ${APACHE_LOG_DIR}/error.log

DocumentRoot ${Gdr}
<Directory   ${Gdr}>
	DirectoryIndex index.php index.html
	Options Indexes FollowSymLinks Multiviews
	AllowOverride All
	
# Kwynn 2023/02/16 - several lines
	RewriteEngine On
	RewriteRule ^index.html /index.php [R=302,L]
	RewriteRule ^t/23/apprentices_2023_01.html 	  /t/23/01/apprentices_2023_01.html    [R=302,L]	
	RewriteRule ^t/23/stuff_for_wealthier_me.html /t/23/01/stuff_for_wealthier_me.html [R=302,L]
# Kwynn 2023/02/20
	RewriteRule ^htvalref.* /t/23/02/htva/htva.php?redir=yes	

	
	Require all granted
	MultiviewsMatch Any
</Directory>

# quiz


<Directory /var/kwynn/photosFA>
        Require all granted
        AllowOverride All
        Options Indexes	
</Directory>

Include sites-available/common/pubcom20min.inc



<Directory /opt/leaflet>
	Require all granted
	Options Indexes
</Directory>

<Directory /var/large_www>
	Require all granted
	AllowOverride All
	Options Indexes
</Directory>

<Directory /opt/js>
    Require all granted
	AllowOverride All
	Options Indexes
</Directory>

# for FT2 / CPCS

<Directory /opt/jq>
    Require all granted
	AllowOverride All
	Options Indexes
</Directory>

# Include sites-available/pubalias.inc

<Location /t/22/06/upsort/test/index.html>
	SetHandler application/x-httpd-php
</Location>
