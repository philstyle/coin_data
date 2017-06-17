#!/bin/bash

FILE=/tmp/doin_cata

curl --silent "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,UBQ,ETC,EXP,MUSIC,ZEC,DGB&tsyms=BTC,USD" > ${FILE}
NOW=`date +%s`
FILEDATE=`echo "scale=0; ( ${NOW} / 86400 )" | bc -l`
for FOLDER in `ls -1 | grep -v "\."`; do 
 
 BTC=`cat /tmp/doin_cata | jq ".${FOLDER}.BTC" | sed -e 's/[eE]+*/\\*10\\^/'`
 BTC=`echo "scale=8; ${BTC}" | bc -l`
 USD=`cat /tmp/doin_cata | jq ".${FOLDER}.USD" | sed -e 's/[eE]+*/\\*10\\^/'`
 USD=`echo "scale=6; ${USD}" | bc -l`
 printf "%s,%s,%s\n" "$NOW" "$USD" "$BTC" >> ${FOLDER}/${FILEDATE}
done
