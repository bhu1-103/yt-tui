#!/usr/bin/zsh

echo -n "enter search query: "
read query
wget https://inv.nadeko.net/search?q=$query
