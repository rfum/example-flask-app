#!/bin/bash
#Refer to the git-controller.service
while [ 1 ];
do 
    sleep 1 
    result=`git pull`
    #Do we synced our VM's codebase with remote GitHub??
    if [ "$result" != "Already up-to-date." ];
    then
        systemctl restart flask-app    
    fi  
done