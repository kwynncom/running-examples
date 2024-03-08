#! /usr/bin/bash
# runs https://github.com/validator/validator, which is the HTML validator Nu Checker
# config lines:

THISV="v 2024-0307-1"
export JAVA_HOME=/usr
# export ANT_HOME=/opt/ant/apache-ant-1.9.16
# export PATH=$PATH:${ANT_HOME}/bin
# directory where you have cloned the above:
NU_CLONE_LOC=/opt/nu
# note that the following is being ignored at the moment, despite messages about doing it
OPTS="--bind-address=127.0.0.1"

# note that the bind address option is being ignored
echo $THISV
echo I am running as `whoami`
echo I am a member of these groups `groups`
cd $NU_CLONE_LOC
nice -n 40 python3 ./checker.py $OPTS run

