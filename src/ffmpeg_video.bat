set "CHANNELS=2" 
set "BITRATE=128k"
set "SAMPLERATE=44100" 
set "FPS=24"
set "RESOLUTION=640:480"
set "ENCODER_FLAGS=-codec:a libmp3lame -b:a %BITRATE% -ar %SAMPLERATE% -ac %CHANNELS% -filter:v fps=%FPS% -vf scale=%RESOLUTION%,setdar=4:3" 

set "DRIVE=%~d2"
set "FOLDER=%~p2"
set "FILENAME=%~n2"
set "NEW_FILEPATH=%DRIVE%%FOLDER%%FILENAME%.avi"
echo %NEW_FILEPATH%

ffmpeg -i %1 -y %ENCODER_FLAGS% "%NEW_FILEPATH%"
pause 2>NUL