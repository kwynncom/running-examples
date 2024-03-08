# needs Apache mods proxy and proxy_http
# local dev 2024/03/08 00:14

# begin included file
<Location /htval>
	RewriteEngine On
	RewriteRule htval$   /htval/			 [R=302,L] 
	RewriteRule htval/$ 	http://localhost:8888/ 	 [R=302,L,P]
	RewriteRule htval/(.+)$ http://localhost:8888/$1 [R=302,L,P]
</Location>
# end included file
