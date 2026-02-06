@echo off
ffmpeg -i "%~1" -ss "%2" -to "%3" -c copy -avoid_negative_ts make_zero "%~dpn1_trimmed%~x1"