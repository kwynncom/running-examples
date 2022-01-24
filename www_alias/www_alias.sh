# get the shell history without line numbers.  I'm populating this doc with the shell history
history -w /dev/stdout
cd /var/
sudo mkdir large_www
cd large_www
# change ownership to the user I log in as / my standard user
sudo chown my-standard-user .
cd my-local-doc-root-copy
# ID the files in question
find | grep json
# corresponds to https://kwynn.com/t/20/10/ua/
cd t/20/10/ua
# ln is a hard link or a completely independent new reference to the same file.  One would have to delete all hard links to delete the file.
# the only additional disk space used is the tiny bit for the reference.  This involves inodes
ln ./kwynn_com_ua_counts.json /var/large_www/user_agents_2020_10.json
# after changing PHP file, rm this and check
rm kwynn_com_ua_counts.json
# https://kwynn.com/t/21/06/ua/
cd ../../../21/06/ua
ln ./user_agents.json /var/large_www/user_agents_2021_06.json
# identify references to the files
grep -R kwynn_com_ua
# the -P invokes what I think is Perl regular expression (regex) syntax, also used in PHP and JavaScript
# . is a special character in regex, so escape it:
grep -RP user_agents\.json
grep -R kwynn_com_ua
