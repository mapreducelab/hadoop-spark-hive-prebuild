# hadoop-spark-hive-prebuild

This Readme file contains the instruction to setup a big data environment:
Hadoop,
Spark,
Zeppelin,
Hive,
Tez, 
Mysql

1. **archive.sh** script creates two backup files: 
- bigdata_$time.tar.gz
The archive includes the profile files (.my.cnf and .bash_profile) and big data specific directories  
- jdk_$time.tar.gz
The archive contains java development kit package

2. **execute_all.sh** script includes the set of shells scripts used for the set up and start the hadoop environment.
All the scripts and commands are executed using the secure shell.

            
    ./execute_all.sh -h <hostname>
    hostname is the mandatory parameter 
    hostname is the target machine for the bigdata set up
    
 The scripts prompt the user to enter the password multiple times during the script execution for interactive logins.
   
Below are the main steps and the corresponding scripts:
  
  - execute **scp** to copy the archive files to the target machine
  - extract the bigdata specific files into the $HOME directory
  - execute **set_up_ssh.sh**,  it generates ssh key to create new authentication for password-less login in order to run the hadoop related programs
  - execute **links.sh**, it creates symbolic links for Hadoop, Spark, Tez, Hive and Zeppelin configurations
  - execute **set_up_env.sh**, it sets up $HOME directory and $user name in the bigdata specific configuration files
  - execute **hadoop_start.sh**, it starts MySQL, Hadoop, Yarn and Zeppelin
  
  3. **hadoop_stop.sh** - includes the set of commands to stop the bigdata related processes
  