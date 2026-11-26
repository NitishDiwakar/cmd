@echo off
setlocal

REM Validate inputs FIRST
if "%~1"=="" goto usage
if "%~2"=="" goto usage

REM Assign arguments
set "INDIR=%~1"
set "BITRATE=%~2"

REM Create output directory
set "OUTDIR=%INDIR%\compressed"
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

REM Process video files
for %%F in ("%INDIR%\*.mp4" "%INDIR%\*.mkv" "%INDIR%\*.avi") do (
    if exist "%%F" (
        echo Compressing: %%~nxF
        ffmpeg -y -i "%%F" -c:v h264_nvenc -b:v %BITRATE% -c:a copy "%OUTDIR%\%%~nxF"
    )
)

echo.
echo Done. Compressed files are in: %OUTDIR%
exit /b 0

:usage
echo Usage:
echo   fcompm directory_name bitrate
echo Example:
echo   fcompm videos 2000k
exit /b 1