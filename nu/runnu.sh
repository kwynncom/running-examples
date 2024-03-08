#! /usr/bin/bash
# runs https://github.com/validator/validator, which is the HTML validator Nu Checker
# directory where you have cloned the just-mentioned validator repo:
NU_CLONE_LOC=/opt/nu

THISV="v-2024-0308-0005-2"

export JAVA_HOME=/usr

# The bind-address option gets contradictory results when the validator starts.  First it says it's binding to 10.1.x.y then it 
# binds to 127....   It works, in any event.
OPTS="--bind-address=127.0.0.1"

echo $THISV
cd $NU_CLONE_LOC
nice -n 40 python3 ./checker.py $OPTS run
