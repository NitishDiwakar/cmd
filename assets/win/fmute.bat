@echo off
ffmpeg -i "%~1" -c:v copy -an "%~dpn1_muted%~x1" && echo Muted: %~dpn1_muted%~x1