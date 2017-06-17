#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR >> /dev/null 2>&1


./getValues.sh


NOW=`date +%s`
LASTCOMMIT=`git log -n1 --oneline --pretty --date=unix | grep "^Date" | awk '{print $2}'` >> /dev/null 2>&1
SECDIFF=`echo "${NOW} - ${LASTCOMMIT}" | bc -l`
if [ ${SECDIFF} -gt "3590" ]; then
 ./pushValues.sh
fi
popd >> /dev/null 2>&1
