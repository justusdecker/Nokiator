set "CHANNELS=2" 
set "BITRATE=128k"
set "SAMPLERATE=44100" 
set "ENCODER_FLAGS=-codec:a libmp3lame -b:a %BITRATE% -ar %SAMPLERATE% -ac %CHANNELS%" 

call ./src/ffmpeg_call.bat "%1" "%ENCODER_FLAGS%" "%2"
pause 2>NUL