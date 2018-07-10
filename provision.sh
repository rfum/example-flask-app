#!/bin/bash
set -e
#Installing base dependencies for flask app
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
cd $GITHUB_REPONAME
# Registering commands of the both flask app and the code base controller script : please refer 
# to .service files for more info. about these commands
cp flask-app.service /etc/systemd/system/flask-app.service
cp git-controller.service /etc/systemd/system/git-controller.service
systemctl start flask-app
systemctl start git-controller
systemctl enable flask-app
systemctl enable git-controller
echo "Application is serving at your host's => 127.0.0.1:8080 endpoint - For more, please check the vagrantfile -"
