#!/bin/bash

# this is a demo script for dynamic include in aws imagebuilder

if [[ `uname -r | grep el6` =~ el6 ]]; then
  export OSVER=6
elif [[ `uname -r | grep el7` =~ el7 ]]; then
  export OSVER=7
elif [[ `uname -r | grep el8` =~ el8 ]]; then
  export OSVER=8
else
  export OSVER="Unknown"
fi

echo "This was the result of the OSVER snippet: $OSVER" | tee /tmp/imagebuilder-demo.log
echo "This was passed dynamically via cli option: $1" | tee -a /tmp/imagebuilder-demo.log

if [[ $OSVER == 8 ]]; then
    yum -y install $1
    echo "Installed package: $1" | tee -a /tmp/imagebuilder-demo.log
fi