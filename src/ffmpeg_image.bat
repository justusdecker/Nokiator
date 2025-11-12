set "RESOLUTION=640:480"
set "FORMAT=rgb24"
set "DPI=96"
set "QUALITY=20"
set "ENCODER_FLAGS=-vf "scale=%RESOLUTION%,format=%FORMAT%" -q:v %QUALITY% -dpi %DPI%" 
ffmpeg -i %1 %ENCODER_FLAGS% output.jpg