#!/usr/bin/zsh

INPUT_FILE="dl.txt"

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101 Firefox/136.0"

while IFS= read -r search_query; do
    [[ -z "$search_query" ]] && continue 

    formatted_query=$(echo "$search_query" | sed 's/ /+/g')

    html_content=$(wget --user-agent="$USER_AGENT" -qO - "https://inv.nadeko.net/search?q=$formatted_query")

    id=$(echo "$html_content" | grep 'a href="/watch?' | grep -viE 'sub|subs|subtitles|unofficial' | head -n 10 | awk -F '"auto">' '{print $1}' | awk -F "v=" '{print $2}' | awk -F '"' '{print $1}' | head -n 1)

    #selected_index=$(paste <(echo "$title") <(echo "$id") | fzf | awk '{print $NF}')

    yt-dlp -f "bestaudio[ext=m4a]" --embed-metadata --embed-thumbnail --add-metadata "https://youtube.com/watch?v=$id"
done < "$INPUT_FILE"
