#!/bin/bash
date=`date "+%Y-%m-%d"`
num=`awk -v min=1 -v max=1000000 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
localfile=~/.githubrandnum/$date-$num.txt
pubfile=numbers/$date-$num.txt
ku create > $localfile
cat $localfile | grep '^Bitcoin address\s*:' | sed 's/^.*: *//' > $pubfile
cat $localfile | grep '^Bitcoin segwit address\s*:' | sed 's/^.*: *//' >> $pubfile
git add numbers/*
git commit -m "daily derp for $date"
git push
echo Ran on $date
