# I might miss something, but should give you the idea
# assuming you are in this directory with the .sh
# assumes /opt/misc exists and you have permssion
# there is no need for root / sudo if not shown just below
ln ./runnu.sh /opt/misc/
# next command not necessary if using service, but might as well have it on hand.
ln ./runNuAsNobody.sh /opt/misc/
sudo ln ./nu.service /etc/systemd/system/
# if you change the file of the service above
sudo systemctl daemon-reload
sudo systemctl start nu
sudo systemctl status nu
# might take 5 - 10 seconds before it responds to HTTP
# confirm running
ps -Ao start,user,group,command | grep checker\.py
# start on reboot
sudo systemctl enable nu
