@echo off
ffmpeg -i "%~1" -c:v h264_nvenc -b:v %2 -c:a copy "%~dpn1_%2.mp4"