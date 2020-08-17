#!/bin/bash
if [ -z "$3" ]
then
	youtube-dl --list-formats $1
	echo 'Write desired format code for VIDEO:'
	read video_format
else
	video_format=`echo $3`
fi
	if [ -z "$2" ]
	then
		echo 'Write desired format code for AUDIO:'
		read audio_format
	else
		audio_format=`echo $2`
	fi
	echo "Starting to download URL: $1, with audio format $audio_format and video format $video_format"
	youtube-dl $1 -f $audio_format --output '%(id)s-audio.%(ext)s'
	youtube-dl $1 -f $video_format --output '%(id)s-video.%(ext)s'
	FILENAME_AUDIO=`youtube-dl $1 -f $audio_format --get-filename --output '%(id)s-audio.%(ext)s'`
	FILENAME_VIDEO=`youtube-dl $1 -f $video_format --get-filename --output '%(id)s-video.%(ext)s'`
	RESULT_FILENAME=`youtube-dl $1 --get-filename --output '%(id)s-result.mp4'`
	ffmpeg -i $FILENAME_AUDIO -i $FILENAME_VIDEO -c:v copy -c:a aac $RESULT_FILENAME
	rm $FILENAME_AUDIO
	rm $FILENAME_VIDEO

