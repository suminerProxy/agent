#!/bin/sh
RUN_NAME="wgcloud-agent-release"
export LANG="en_US.UTF-8"
PRG=$0
APPDIRFILE=`dirname "$PRG"`
cd $APPDIRFILE
echo $APPDIRFILE/$RUN_NAME
PID=`ps -ef|grep $RUN_NAME|grep -v grep|awk '{printf $2}'`
echo $PID
if [ ! -n "$PID" ];
then
   echo "wgcloud-agent程序开始启动"
else
   echo "已启动,杀掉进程后重启"
   echo $PID
   ps -ef | grep $RUN_NAME | grep -v grep | awk '{print $2}' | xargs kill
fi
if test -x $RUN_NAME;
then
nohup ./$RUN_NAME  >/dev/null 2>&1 &
else
sudo chmod +x $RUN_NAME
nohup ./$RUN_NAME  >/dev/null 2>&1 &
fi
