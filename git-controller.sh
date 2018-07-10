#!/bin/bash
#Refer to the git-controller.service
while [ 1 ];
do 
    sleep 1 
    result=`git pull`
    if [ "$result" != "Already up-to-date." ];
    then
        systemctl restart flask-app    
    fi  
done