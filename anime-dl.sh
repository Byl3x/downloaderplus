#!/bin/bash
#Anime Downloader/Player script (wrapper for anime-downloader)
#This is just made to be a bit more user friendly
echo "What would you like to do?(play/download)"
read use
if [ use == "play" ]
then
	anime play --list
else
	echo "What anime would you like to download"
	read animename
	echo "What provider to download from?(It is recommended to use 9anime)"
	read extraargs
	anime dl "$animename" --provider "$extraargs"
fi
