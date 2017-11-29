#!/bin/bash


# changing Mysql env

user=`whoami`
sed -i 's/bigdata_user/'"${user}"'/g' $HOME/.my.cnf
home_var=`echo $HOME`
echo ${home_var}|sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/.my.cnf
echo ${home_var}|sed -i 's|\/usr\/local|'"${home_var}"'|g' $HOME/mysql/bin/mysql_config
echo ${home_var} |sed -i 's|\/usr\/local|'"${home_var}"'|g' $HOME/mysql/bin/mysqld_safe
#changing Hadoop env
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/hadoop/conf/yarn-site.xml
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/hadoop/conf/core-site.xml
sed -i 's/big_data_home/$HOME/' $HOME/hadoop-2.8.1/conf/hadoop-env.sh
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/hadoop/conf/hdfs-site.xml


echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/hadoop/conf/mapred-env.sh
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/hadoop/conf/yarn-env.sh

#changing spark eng

echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/spark/conf/spark-env.sh
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/spark/conf/spark-defaults.conf
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/spark/conf/hive-site.xml



#changing conf
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/conf/hadoop/conf/core-site.xml
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/conf/hadoop/conf/hadoop-env.sh
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/hadoop/conf/hadoop-env.sh

echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/conf/hadoop/conf/hdfs-site.xml
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/conf/hadoop/conf/mapred-env.sh
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/conf/hadoop/conf/yarn-env.sh
echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/conf/hadoop/conf/yarn-site.xml

echo ${home_var} |sed -i 's|big_data_home|'"${home_var}"'|g' $HOME/zeppelin-0.7.3-bin-all/conf/zeppelin-env.sh

user=`whoami`
sed -i 's/bigdata_user/'"${user}"'/g' $HOME/zeppelin-0.7.3-bin-all/conf/interpreter.json
hostname=`hostname`
sed -i 's/host_name/'"${hostname}"'/g' $HOME/zeppelin-0.7.3-bin-all/conf/interpreter.json

hadoop namenode -format
