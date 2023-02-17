#!/bin/bash
URL="https://www.quotedb.com/quote/quote.php?action=random_quote_rss"
DATA=$(curl --silent "$URL" | grep -E "(^\\s{3}<title>|^\\s{3}<description>)")
AUTHOR=$(printf '%s\n' "$DATA" | sed -n 's:.*<title>\(.*\)</title>:\1:p')
QUOTE=$(printf '%s\n' "$DATA" | sed -n 's:.*<description>\(.*\)</description>:\1:p' | sed 's/&#34;/"/g' | sed "s/&#39;/'/g")
echo "$QUOTE" | fold -w 80 -s
echo -e "\t\t- $AUTHOR"
