@echo off
yt-dlp --cookies cookies1.txt -f "bv*[height<=1080]+ba/b[height<=1080]" --merge-output-format mp4 %*