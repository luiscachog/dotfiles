#!/bin/sh

# If no options passed from command line, give usage instructions
if [[ -z "$1" || -z "$2"  ]]; then
    echo ""
    echo "Usage: test.sh [URL] [CDN or ORIGIN TCP HOSTNAME/IP]"
    exit 0
fi

url=$1
newtcphost=$2
host=$( echo "$url" | perl -MURI -le 'chomp($url = <>); print URI->new($url)->host'  )

hostheader=$host
newurl=${url/$host/$newtcphost}

echo Old Host Header: $host
echo New Host Header: $hostheader
echo New TCP Host: $newtcphost
echo Test URL: $newurl

curl -w '\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\nDownload Speed:\t%{speed_download}\n\nTotal time:\t%{time_total}\n' -v -k --compressed --insecure -H  'User-Agent:Mozilla/4.0 (compatible; MSIE 8.0)' -H Host:$hostheader -o /dev/null -s $newurl '

