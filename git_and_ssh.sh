# while working on www_alias, 2022/01/24, I realized I need to do work on git
# in turn needed ssh stuff
# see www_alias/README.md
cd ~/.ssh
ls
# There is the key corresponding to GitHub
eval "$(ssh-agent -s)"
# correct result is a number such as
Agent pid 53752
# the file is the private key.  There is no password so no -K needed
ssh-add ./github_2021_08_1_kwynn_com
ssh -T git@github.com
# Success:
# Hi kwynncom! You've successfully authenticated, but GitHub does not provide shell access.
cd /opt/kwynn
git remote set-url origin git@github.com:kwynncom/kwynn-php-general-utils.git
# fetch does NOT change the local environment
git fetch
git diff origin master
git status
# On branch master
#Your branch is behind 'origin/master' by 3 commits, and can be fast-forwarded.
#  (use "git pull" to update your local branch)
# nothing to commit, working tree clean
# when you're ready to sync:
git pull
# Updating 56f9028..8c21df0
# Fast-forward
# README.md           |  3 +++
# boot/README.md      |  5 +++++
# ...
# 8 files changed, 74 insertions(+), 16 deletions(-)
# create mode 100644 js/kwjsrecv.php
