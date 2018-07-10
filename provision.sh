#!/usr/bin/env bash
set -e 
echo "export GITHUB_USERNAME=$GITHUB_USERNAME" > /home/vagrant/.profile
echo "export GITHUB_REPONAME=$GITHUB_REPONAME" > /home/vagrant/.profile
apt-get update
apt-get install -y python-pip python-dev git jq curl
pip install gunicorn flask
mkdir myproj
cd myproj
export RESULT=`curl https://api.github.com/repos/"$GITHUB_USERNAME"/"$GITHUB_REPONAME" | jq -r ."message"`
#Check if the repo is exists if not exit from script with err no 1 
if [ "$RESULT" != "Not Found" ];
then
   git clone https://github.com/"$GITHUB_USERNAME"/"$GITHUB_REPONAME"
else
   echo "Given username-repo tuple is not exists!Exiting with error..."
   exit 1
fi
gunicorn --bind 0.0.0.0:80 main:app
unset $RESULT
