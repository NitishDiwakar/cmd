@echo off
pushd "%~dp1"

set "TF=%~n1_vidstab.trf"

ffmpeg -i "%~nx1" -vf "vidstabdetect=result=%TF%" -f null - && ^
rem ffmpeg -i "%~nx1" -vf "vidstabtransform=input=%TF%" -c:v libx264 "%~n1_stabilized%~x1"
ffmpeg -i "%~nx1" -vf "vidstabtransform=input=%TF%" -c:v h264_nvenc "%~n1_stabilized%~x1"

del "%TF%" >nul 2>&1
popd