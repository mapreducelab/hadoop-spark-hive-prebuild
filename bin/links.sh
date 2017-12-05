#!/bin/bash

# checking hadoop link

cd $HOME

hadoop fs -mkdir -p /apps/tez

mkdir -p ~
if [ -d ~/data/hdfs/namenode/ ]
then
    echo "Directory /data/hdfs/namenode/ exists"
    else
    mkdir -p ~/data/hdfs/datanode/
fi


if [ -d ~/data/hdfs/namenode/ ]
then
    echo "Directory /data/hdfs/namenode/ exists"
    else
    mkdir -p ~/data/hdfs/namenode/
fi

hadoop="hadoop"
if [ -L ${hadoop} ] && [ -e ${hadoop} ] ; then

      echo "Good link"
   else
      echo "Broken link... creating"
      ln -sf  $HOME/hadoop-2.8.1 $HOME/hadoop

   fi

# checking spark link
spark_link="spark"
if [ -L ${spark_link} ] && [ -e ${spark_link} ] ; then

      echo "Good link"
   else
      echo "Broken link... creating"
      ln -sf spark-2.2.0-bin-hadoop2.7 spark

   fi


# checking hive link
hive_link="hive"
if [ -L ${hive_link} ] && [ -e ${hive_link} ] ; then

      echo "Good link"
   else
      echo "Broken link... creating"
      ln -sf $HOME/apache-hive-1.2.2-bin  $HOME/hive

fi

#checking tez link
tez_link="tez"
if [ -L ${tez_link} ] && [ -e ${tez_link} ] ; then

      echo "Good link"
   else
      echo "Broken link... creating"
      ln -sf apache-tez-0.9.0-bin tez

fi

#checking zeppelin link
zepellin_lin="zeppelin"
if [ -L ${zepellin_lin} ] && [ -e ${zepellin_lin} ] ; then

      echo "Good link"
   else
      echo "Broken link... creating"
      ln -sf zeppelin-0.7.3-bin-all zeppelin

fi




# checking conf links
# spark
spark_conf="spark-2.2.0-bin-hadoop2.7/conf"

if [ -L ${spark_conf} ] && [ -e ${spark_conf} ] ; then
      echo "Good link"
   else
      echo "Broken link... Creating"
      ln -sf $HOME/conf/spark/conf/ $HOME/spark-2.2.0-bin-hadoop2.7/conf

fi

# hadoop
hadoop_conf="hadoop-2.8.1/conf"

if [ -L ${hadoop_conf} ] && [ -e ${hadoop_conf} ] ; then
      echo "Good link"
   else
      echo "Broken link... Creating"
      ln -sf $HOME/conf/hadoop/conf/ $HOME/hadoop-2.8.1/conf

fi

# hive
hive_conf="apache-hive-1.2.2-bin/conf"

if [ -L ${hive_conf} ] && [ -e ${hive_conf} ] ; then
      echo "Good link"
   else
      echo "Broken link... Creating"
      ln -sf $HOME/conf/hive/conf/ $HOME/apache-hive-1.2.2-bin/conf

fi


# zeppelin
zeppelin_conf="zeppelin-0.7.3-bin-all/conf/hive-site.xml"

if [ -L ${zeppelin_conf} ] && [ -e ${zeppelin_conf} ] ; then
      echo "Good link"
   else
      echo "Broken link... Creating"
      ln -sf $HOME/conf/hive/conf/hive-site.xml zeppelin-0.7.3-bin-all/conf/hive-site.xml

fi





# links for spark-2.2.0-yarn-shuffle.jar

yarn-shuffle-t="hadoop/share/hadoop/tools/lib/spark-2.2.0-yarn-shuffle.jar"
yarn-shuffle="hadoop/share/hadoop/yarn/lib/spark-2.2.0-yarn-shuffle.jar"

rm -rf $HOME/hadoop/share/hadoop/tools/lib/spark-2.2.0-yarn-shuffle.jar
rm -rf $HOME/hadoop/share/hadoop/yarn/lib/spark-2.2.0-yarn-shuffle.jar

if [ -L ${yarn-shuffle-t} ] ; then
      echo "Good link"
   else
      echo "Broken link... Creating"
      ln -sf $HOME/spark/yarn/spark-2.2.0-yarn-shuffle.jar  $HOME/hadoop/share/hadoop/tools/lib/spark-2.2.0-yarn-shuffle.jar

fi



if [ -L ${yarn-shuffle} ]  ; then
      echo "Good link"
   else
      echo "Broken link... Creating"
      ln -sf $HOME/spark/yarn/spark-2.2.0-yarn-shuffle.jar  $HOME/hadoop/share/hadoop/yarn/lib/spark-2.2.0-yarn-shuffle.jar

fi
