#! /bin/bash

echo "Stopping Zeppelin"
$HOME/zeppelin/bin/zeppelin-daemon.sh stop

echo "Stoping Yarn resource manager"
$HOME/hadoop/sbin/stop-yarn.sh

echo "Stopping Hadoop file system"
$HOME/hadoop/sbin/stop-dfs.sh




echo "Stopping MySQL"
mysql_pid=`cat $HOME/mysql.pid`
child_mpid=`ps -o pid --no-headers --ppid $mysql_pid`
kill -9 $mysql_pid
kill -9 $child_mpid
