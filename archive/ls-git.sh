#!/bin/sh

set -e
user='git'
server='fl-jump2-dv.dev.fierylab.com'
dir='/opt/git'

function usage() {
  echo "Usage: $0 [-l|-h|-r <repo>|-k <keyfile>]" 
  exit
}

if [ $1 ] ; then
  if [ "$1" = '-l' ] ; then
    echo "Listing all git repos at $user@$server:$dir"
    ssh -t $user@$server "ls -l $dir"
    exit
  elif [ "$2" = '' ] ; then
    usage
  else
    if [ "$1" = '-r' ] ; then
      command="git-create-repo"
    elif [ "$1" = '-k' ] ; then
      command="git-add-key"
    else 
      usage
    fi
    ssh -t $user@$server "
      $command $2"
  fi
fi
