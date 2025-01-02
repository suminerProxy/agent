#!/bin/sh
RUN_NAME="wgcloud-agent-release"
export LANG="en_US.UTF-8"
PRG=$0
APPDIRFILE=`dirname "$PRG"`
echo $APPDIRFILE/$RUN_NAME
PID=`ps -ef|grep $RUN_NAME|grep -v grep|awk '{printf $2}'`
echo $PID
if [ ! -n "$PID" ];
then
   echo "wgcloud-agent程序未启动"
else
   echo "已杀掉进程"
   echo $PID
   ps -ef | grep $RUN_NAME | grep -v grep | awk '{print $2}' | xargs kill
fi
