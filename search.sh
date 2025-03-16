#!/usr/bin/zsh

echo -n "Enter search query: "
read search_query 
formatted_query=$(echo "$search_query" | sed 's/ /+/g')
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101 Firefox/136.0"
echo "Searching for: $search_query ..."

echo "link: https://inv.nadeko.net/search?q=$formatted_query"

wget --user-agent="$USER_AGENT" -qO- "https://inv.nadeko.net/search?q=$formatted_query" -qO index.html

#id=$(cat index.html | grep 'a href="/watch?' | grep -viE 'lyric|lyrics|sub|subs|subtitles|unofficial' | head -n 1 | awk -F "=" '{print $4}' | awk -F '"' '{print $1}')
id=$(cat index.html | grep 'a href="/watch?' | grep -viE 'sub|subs|subtitles|unofficial' | head -n 1 | awk -F "=" '{print $3}' | awk -F '"' '{print $1}')

echo $id

yt-dlp -f "bestaudio[ext=m4a]" --embed-metadata --embed-thumbnail --add-metadata "youtube.com/watch?v=$id"
