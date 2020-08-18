# downloaderplus
A small collection of scripts to improve or make some content downloaders easier/more convenient to use
## List:
ytdl-AV-mix.sh-a script that mixes audio and video when downloading to get higher resolution or better audio.
anime-dl.sh-a simple wrapper for anime-downloader
### ytdl-AV-mix Usage:
`./ytdl-AV-mix.sh <url> <audio code> <video code> <output format> <subtitles(y/n) <additional args for youtube-dl>>`
alternatively you can just enter the url and the script will ask for everything else
### anime-dl.sh Usage:
`./anime-dl.sh`, The program is going to ask what you want to do with it (download/play).
## Installation:
If you're running a Debian-based distro, you can use the setup.sh script.
If not, just install `python3, python3-pip, mpv, ffmpeg, wget` with your package manager. Then do `pip3 install anime-downloader` and install youtube-dl
(`sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl`).
