#!/bin/bash
#ytdl-AV-mix
#made by Byl3x in vim
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
if [ -z "$5" ]
then
	echo "Do you want to download subtitles?(y/n)"
	read subtitles
else
	subtitles=`echo $5`
fi
if [ $subtitles == "y" ]
then
	ytdlarg1=" --all-subs "
else
	ytdlarg1=""
fi

#echo "Any additional arguments for youtube-dl?(separate with spaces)"
#read additionalargs
#Uncomment previous 2 lines to make this check ask for additional arguments
echo "Starting to download URL: $1, with audio format $audio_format and video format $video_format"
youtube-dl $1 -f $audio_format --output '%(id)s-audio.%(ext)s'$ytdlarg1 $additionalargs
youtube-dl $1 -f $video_format --output '%(id)s-video.%(ext)s'$ytdlarg1 $additionalargs
FILENAME_AUDIO=`youtube-dl $1 -f $audio_format --get-filename --output '%(id)s-audio.%(ext)s'`
FILENAME_VIDEO=`youtube-dl $1 -f $video_format --get-filename --output '%(id)s-video.%(ext)s'`
if [ -z "$4" ]
then
	echo 'Write desired output format (mkv, mp4 or m4a), mkv does not to transcode so the output will be faster:'
	read output_format
else
	output_format=`echo $4`
fi

RESULT_FILENAME=`youtube-dl $1 --get-filename --output '%(title)s-result.'`
RESULT_FILENAME="${RESULT_FILENAME}${output_format}"
if [ $output_format == "mp4" ]
	then
	ffmpeg -i $FILENAME_AUDIO -i $FILENAME_VIDEO -c:v copy -c:a aac "$RESULT_FILENAME"
elif [ $output_format == "mkv" ]
then
	ffmpeg -i $FILENAME_AUDIO -i $FILENAME_VIDEO -c copy "$RESULT_FILENAME"
elif [ $output_format == "m4a" ]
then
	ffmpeg -i $FILENAME_AUDIO -i $FILENAME_VIDEO -c:v copy -c:a aac "$RESULT_FILENAME"
fi
#Comment 2 below to keep audio and video files
rm $FILENAME_AUDIO
rm $FILENAME_VIDEO
echo "The output file is ${RESULT_FILENAME}"
