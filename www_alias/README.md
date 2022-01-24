The problem I'm solving involves the JSON files containing browser / user agent data on users of my site.  Certain phrases in the files clutter my 
"grep -R" searches of my local copy of my web site.  Otherwise put, those JSON files are data, not code, and need to be moved out of the main tree / 
DOCUMENT_ROOT tree of my site.

I'm going to put the files in /var/large_www
/var/www exists by default, although I do not use it.  So it makes sense to put it there.
"large" is not exactly the problem in this case; it's more like a type of info that clutters my site copy.  I separate large data in other instances, 
though, and put "large" in the filename, so I'll go with it.

One of the PHP files to change is almost identical to this:
https://github.com/kwynncom/web-server-access-log-analysis/blob/30d9be12414223f03dcc130c6f2b8daf29a551fe/agent_sa/datToWeb.php

I realized I had hardcoded one of the files into an .html.  This is the sort of thing I'm trying to reverse right now.  
While looking at the steps needed to change the HTML back to PHP, I had git and git / ssh problems on kwynn.com

I already had the public and private keys for GitHub on kwynn.com, but I needed to do stuff as documented in 
../git_and_ssh.sh

In GitHub, got to Settings and then "SSH and GPG keys"
I saw the relevant public key that corresponds to a private key on Kwynn.com, but the private key was not active.

This is one of the relevant pages:

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Again, I didn't have to do that much work.
