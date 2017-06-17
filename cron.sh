#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR >> /dev/null 2>&1


./getValues.sh


NOW=`date +%s`
LASTCOMMIT=`git log -n1 --oneline --pretty --date=unix | grep "^Date" | awk '{print $2}'` >> /dev/null 2>&1
echo $LASTCOMMIT
exit 0
SECDIFF=`echo "${NOW} - ${LASTCOMMIT}" | bc -l`
echo $SECDIFF
exit 0
if [ ${SECDIFF} -gt "3600" ]; then
 ./pushValues.sh
fi
popd >> /dev/null 2>&1
