#! /bin/bash

echo "Starting MySQL "
mysqld_safe &
echo $! > $HOME/mysql.pid



echo "Starting Hadoop"
$HOME/hadoop/sbin/start-dfs.sh



echo "Starting yarn"
$HOME/hadoop/sbin/start-yarn.sh


echo "Starting Zeppelin"
$HOME/zeppelin/bin/zeppelin-daemon.sh start
