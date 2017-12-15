#!/bin/bash

# non-SSL ranges; SSL range are 4370--4379
START=4380
END=4389

CURRENT=$START

until [ $CURRENT -ge $END ]; do
    curl  --silent -o /dev/null --connect-timeout 0.1 http://127.0.0.1:$CURRENT/service/version.json?service=remote
    if [ $? -eq 0 ]
    then
        echo $CURRENT
        exit
    fi
    let "CURRENT=CURRENT+1"
done
