#!/bin/bash
#Anime Downloader/Player script (wrapper for anime-downloader)
#This is just made to be a bit more user friendly
echo "What would you like to do?(play/download)"
read use
if [ use == "play" ]
then
	anime play --list
elif [ use == "download"]
then
	echo "Playing requires MPV"
	echo "What anime would you like to play?"
	read animename
	anime dl $animename
