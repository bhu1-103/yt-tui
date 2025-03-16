#!/usr/bin/zsh

echo -n "Enter search query: "
read search_query 
formatted_query=$(echo "$search_query" | sed 's/ /+/g')
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101 Firefox/136.0"
echo "Searching for: $search_query ..."
wget --user-agent="$USER_AGENT" -qO- "https://inv.nadeko.net/search?q=$formatted_query" -qO index.html

tag=$(cat index.html | grep 'href="/watch?' | head -n 1 | awk -F "=" '{print $4}' | awk -F '"' '{print $1}')

yt-dlp -f "bestaudio" "youtube.com/watch?v=$tag"
