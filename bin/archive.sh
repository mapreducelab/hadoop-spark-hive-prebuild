#!/bin/bash


etlDir=`echo $HOME`
echo $etlDir
cd "$etlDir"
time=`date +%b-%d-%y`
backupFilename=bigdata_$time.tar.gz
jdkFilename=jdk_$time.tar.gz
rm -rf jdk*tar.gz
rm -rf bigdata*.gz

# cd /usr/java/

tar -cpzf $HOME/$jdkFilename $JAVA_HOME --absolute-names
cd "$etlDir"
tar -cpzf ./$backupFilename ./.my.cnf ./bin ./.bash_profile ./apache-tez-0.9.0-bin   ./jdk1.8.0_92 ./sdwh ./conf ./mysql  ./apache-hive-1.2.2-bin ./spark-2.2.0-bin-hadoop2.7 ./hadoop-2.8.1 ./zeppelin-0.7.3-bin-all --exclude=./mysql/mysql
.sock --exclude=./*.tar.gz --exclude=./$backupFilename --exclude=./data --exclude=./monda  --absolute-names
