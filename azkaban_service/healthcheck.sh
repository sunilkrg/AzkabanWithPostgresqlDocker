#!/bin/bash

#######################################################
####Activate the executor##############################
#######################################################
while true;
do
PROCESS=`ps -ef | grep azk`
echo $PROCESS

if [[ "$PROCESS" == *"AzkabanExecutor"* || "$PROCESS" == *"azkaban-exec"*  ]]
then
RESPONSE=`curl http://localhost:12321/executor?action=activate`
echo "Response of Curl : $RESPONSE"
  if [[ "$RESPONSE" == *"success"* ]]
    then
    break
  fi
fi
sleep 2
done

echo "##################################################"
echo "###############Executor is up#####################"
echo "##################################################"

#######################################################
####Check the processess and add health.txt############
####for Liveness probe                     ############
#######################################################
while true;
do
PROCESS=`ps -ef | grep azk`
echo $PROCESS

if [[ ( "$PROCESS" == *"AzkabanExecutor"* || "$PROCESS" == *"azkaban-exec"* ) ]] && [[ ( "$PROCESS" =~ "AzkabanWeb" || "$PROCESS" == *"azkaban-web"* ) ]]
then
    echo "both are up"
touch health.txt
else
        echo "file to be removed"
        rm -rf health.txt
fi
sleep 30
done

