set "CHANNELS=2" 
set "BITRATE=128k"
set "SAMPLERATE=44100" 
set "ENCODER_FLAGS=-codec:a libmp3lame -b:a %BITRATE% -ar %SAMPLERATE% -ac %CHANNELS%" 
echo %ENCODER_FLAGS%

echo Started converting %1 to %2
if NOT "%3"=="" (
    echo ENCODER_FLAGS: %3
)

ffmpeg -i %1 %ENCODER_FLAGS% -y %2
pause 2>NUL