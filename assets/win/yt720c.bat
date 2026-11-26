@echo off
rem yt-dlp -f "bv*[height<=720]+ba/b[height<=720]" --merge-output-format mp4 %*
yt-dlp --cookies cookies1.txt -f "bv*[height<=720]+ba/b[height<=720]" --merge-output-format mp4 %*