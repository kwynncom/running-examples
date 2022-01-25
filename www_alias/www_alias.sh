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
# my local machine, starting to sync code changes
cd /opt/kwynn
git diff
git add -A .
git commit -m "js inht()"
git push
# syncing to live web, first the dry runs
# the grep shows what files will change
rsync --dry-run --delete -aL4zvv --itemize-changes -e "ssh -i /.../t3a-...-.pem" /local_www ubuntu@kwynn.com:/remote_www/ | grep -P "\.\."
# files that will be added
rsync --dry-run --delete -aL4zvv --itemize-changes -e "ssh -i /.../t3a-...-.pem" /local_www ubuntu@kwynn.com:/remote_www/ | grep -P "\+\+"
# will be deleted
rsync --dry-run --delete -aL4zvv --itemize-changes -e "ssh -i /.../t3a-...-.pem" /local_www ubuntu@kwynn.com:/remote_www/ | grep -i del
# this is not a drill / dry run
rsync           --delete -aL4zvv --itemize-changes -e "ssh -i /.../t3a-...-.pem" /local_www ubuntu@kwynn.com:/remote_www/ 
# remove the unneeded files so that the code looks like as shown in this folder's README
# modify the apache config files as shown in /apache2/run_local
# then restart / reload apache
sudo systemctl reload apache2
# hard link files from my local web copy to my web logs repo, as mentioned in README
# REMOTE / LIVE KWYNN.com:
# create the links and permissions similar to above in /var/large_www
# go mod apache
cd /etc/apache2
cd sites-av*
sudo nano common10.conf
# checks syntax of config files
sudo apachectl configtest
# a graceful restart means wait for all connections to close / all users to pause momentarily
sudo apachectl graceful
# for reasons I'm not sure of, I have to do this again:
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_2021_08_1_kwynn_com
ssh -T git@github.com
git fetch
git diff origin
git status
# sync the /opt/kwynn/js/utils.js change
git pull
