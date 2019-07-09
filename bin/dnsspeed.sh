#!/bin/bash

echo "Testing dns performance with random urls"

# We'll generate a list of urls that we're moderately certain doesn't exist in our cache to get a good base line for speed increases.
URLS=`for i in {1..50}; do echo www.$RANDOM.com;done`

# Make the requests in parallel
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms" }'
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms" }'
echo $URLS | xargs -I^ -P50 dig @127.0.0.1 grep time | awk /time/'{sum+=$4} END { print "average response = ", sum/NR,"ms" }'

echo 'Installation complete. Enjoy!'

