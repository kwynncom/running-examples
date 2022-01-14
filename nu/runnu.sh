#! /usr/bin/bash
# runs https://github.com/validator/validator, which is the HTML validator Nu Checker
# config lines:

THISV="v final script - 2022-01-14 00:59"
export JAVA_HOME=/usr
NU_CLONE_LOC=/opt/nu
# note that the following is being ignored at the moment, despite messages about doing it
OPTS="--bind-address=127.0.0.1"

# note that the bind address option is being ignored
echo $THISV
echo I am running as `whoami`
echo I am a member of these groups `groups`
cd $NU_CLONE_LOC
python3 ./checker.py $OPTS run
