#A script for installing all dependencies (only for Debian-based Distros or distros that use apt)
sudo apt-get install ffmpeg python3 python3-pip wget
sudo pip3 install anime-downloader
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
