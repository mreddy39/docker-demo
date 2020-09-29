#!/bin/sh

total=`free -m | grep Mem: | tr -s ' ' | cut -d ' ' -f 2`
used=`free -m | grep Mem: | tr -s ' ' | cut -d ' ' -f 3`
buffer=`free -m | grep Mem: | tr -s ' ' | cut -d ' ' -f 6`
cache=`free -m | grep Mem: | tr -s ' ' | cut -d ' ' -f 7`

usedmem=`expr $used - $buffer - $cache`
usedmemper1=`expr $usedmem \* 100`
usedmemper=`expr $usedmemper1 / $total`

cpu=`top -n1 -b | head | grep idle | tr -s ' ' | cut -d ' ' -f 8 | tr '\n' ' ' | cut -d ' ' -f 1 | sed 's/%//g'`
cpuusageper=`expr 100 - $cpu`

pid=`ps -ef | grep $2 | head -1 | tr -s ' ' | cut -d ' ' -f 2`
totalthread=`ls /proc/$pid/task | wc -l`

var=`netstat -an | grep :$1 | grep LISTEN | wc -l`
status=`netstat -an | grep :$1 | grep LISTEN | tr -s ' ' | cut -d ' ' -f 6`

if [ $usedmemper -ge 80 ] || [ $cpuusageper -ge 80 ] || [ $var -eq 0 ] || [ $totalthread -ge 70 ]
then
    printf "memory usage in %%: "$usedmemper
    printf "\ncpu uasge in %%: "$cpuusageper
    printf "\n"$1" port status : "$status
    printf "\nTotal Threads in use for "$2" : "$totalthread
    printf "\nRestarting the container as at least one of the above thresholds have been breached.\n"
    exit 1
else
    exit 0
fi
