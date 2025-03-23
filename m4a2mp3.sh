#!/usr/bin/zsh
for file in *.m4a; do
    ffmpeg -i "$file" -q:a 2 "${file%.m4a}.mp3"
done
