#!/usr/bin/zsh

echo -n "Enter search query: "
read search_query 
formatted_query=$(echo "$search_query" | sed 's/ /+/g')
USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101 Firefox/136.0"
echo "Searching for: $search_query ..."

echo "link: https://inv.nadeko.net/search?q=$formatted_query"

wget --user-agent="$USER_AGENT" "https://inv.nadeko.net/search?q=$formatted_query" -qO index.html

title=$(cat index.html | grep 'a href="/watch?' | grep -viE 'sub|subs|subtitles|unofficial' | head -n 10 | awk -F '"auto">' '{print $2}' | awk -F "</p>" '{print $1}')

id=$(cat index.html | grep 'a href="/watch?' | grep -viE 'sub|subs|subtitles|unofficial' | head -n 10 | awk -F '"auto">' '{print $1}' | awk -F "v=" '{print $2}' | awk -F '"' '{print $1}')

#selected=$(paste <(echo "$title") <(echo "$id") | fzf | awk '{print $NF}')

#echo $selected
#selected_index=$(for i in "${!titles[@]}"; do echo "$i) ${titles[$i]}"; done | fzf | awk -F ')' '{print $1}')

selected_index=$(paste <(echo "$title") <(echo "$id") | fzf | awk '{print $NF}')

if [[ -n "$selected_index" ]]; then
    echo "Selected video ID: $selected_index"
    echo "Watch here: https://youtube.com/watch?v=$selected_index"
fi

