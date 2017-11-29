# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH


export JAVA_HOME=$HOME/jdk1.8.0_92
export JRE_HOME=$JAVA_HOME/jre
export HADOOP_HOME=$HOME/hadoop
export HADOOP_PREFIX=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/conf
export HIVE_HOME=$HOME/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf
export TEZ_INSTALL_DIR=$HOME/tez
export TEZ_CONF_DIR=$TEZ_INSTALL_DIR/conf
export TEZ_JARS=$(echo "$TEZ_INSTALL_DIR"/*.jar | tr ' ' ':'):$(echo "$TEZ_INSTALL_DIR"/lib/*.jar | tr ' ' ':')
if [ -z "$HIVE_AUX_JARS_PATH" ]; then
      export HIVE_AUX_JARS_PATH="$TEZ_JARS"
else
      export HIVE_AUX_JARS_PATH="$HIVE_AUX_JARS_PATH:$TEZ_JARS"
fi
export SPARK_HOME=$HOME/spark
export SPARK_CONF_DIR=$SPARK_HOME/conf
export SJS=$HOME/sjs
export PATH=$PATH:$HOME/bin:$HOME/mysql/bin:$HADOOP_CONF_DIR:$HOME/apache-maven-3.5.0/bin:$TEZ_INSTALL_DIR/bin:$HADOOP_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$SJS:${JA
VA_HOME}/bin:$HOME/zeppelin/bin
export HADOOP_CLASSPATH=$HADOOP_CONF_DIR:$HADOOP_CLASSPATH:${TEZ_CONF_DIR}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*
