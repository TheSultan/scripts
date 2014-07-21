#!/bin/sh

set -e
user='ec2-user'
server='mft.fierylab.com'
dir='/mnt/data/bw_mft/from_bw'

if [ $1 ] ; then
  if [ "$1" = '-l' ] ; then
    echo "Listing all downloadable files from $user@$server:$dir"
    ssh -t $user@$server "sudo ls -l $dir"
    exit
  elif [ "$1" = '-h' ] ; then
    echo "Usage: $0 [-l|-h|filename]" 
    exit
  else
    file=$1
  fi
else
  file="lightspeed-transfer.tgz"
fi

echo "Downloading $file from $user@$server:$dir"
ssh -t $user@$server "
  sudo cp $dir/$file ~$user
  sudo chown $user ~$user/$file
  "
scp $user@$server:$file .
ssh -t $user@$server "sudo rm ~$user/$file"
