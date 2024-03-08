# needs Apache mods proxy and proxy_http
# 2024/03/06 02:56
# local dev working version 2024/03/04 22:44

# begin included file
<Location /htval>
	RewriteEngine On
	RewriteRule htval$   /htval/			 [R=302,L] 
	RewriteRule htval/$ 	http://localhost:8888/ 	 [R=302,L,P]
	RewriteRule htval/(.+)$ http://localhost:8888/$1 [R=302,L,P]
</Location>
# end included file
