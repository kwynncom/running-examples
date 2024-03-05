<VirtualHost *:80>
	ServerName ${Gsn}
	RewriteEngine On
	RewriteRule ^ https://${Gsn}%{REQUEST_URI} [L,NE]
	
	Include sites-available/common/publogs.inc
	
</VirtualHost>

