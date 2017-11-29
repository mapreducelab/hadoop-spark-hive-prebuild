#!/bin/bash

#set -xv

function usage() {
  cat >&2 << __USAGE__

Usage: ${0} -h host

Where:
  -h host        : db host

__USAGE__
}

while getopts "h:" option; do
  case "${option}" in
    h)  host="${OPTARG}";;
        *)  usage
        exit 2;;
  esac
done

if [ -z "${host}" ]
then
  usage
  exit 1
fi
echo ${host}

user=`whoami`

cd $HOME
source .bash_profile;bin/set_up_ssh.sh





ssh $user@${host}  "source .bash_profile; rm -rf  bigdata_*.tar.gz"
scp bigdata*.tar.gz jdk*.tar.gz $user@${host}:~



ssh $user@${host} "tar -xzvf bigdata_*.tar.gz"
ssh $user@${host} "tar -xzvf jdk_*tar.gz "

ssh $user@${host} "source .bash_profile; bin/set_up_ssh.sh;exit; "

ssh $user@${host} "source .bash_profile;  bin/links.sh; bin/set_up_env.sh; bin/hadoop_start.sh; exit;"
