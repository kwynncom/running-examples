# 2024/03/07 23:59 Thu

# assuming you are in this directory with the .sh
# assumes /opt/misc exists and you have permssion

ln ./runnu.sh /opt/misc/

ln ./runnu.sh /opt/misc/

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

