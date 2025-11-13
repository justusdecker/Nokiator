:: ##########################################################################
:: # Script Name: Nokia_RM_1190_Video_Setup (Main Script)
:: # Description:
:: #   This script defines the necessary FFmpeg encoding parameters for 
:: #   video conversion optimized for Nokia devices (like RM-1190). 
:: #   It constructs the output file path based on the second argument (%2)
:: #   and then forwards all required variables (Input File %1, Flags, 
:: #   Output Path) to a separate batch file for execution.
:: #
:: # Input Parameters:
:: #   %1: The full path to the **source video file** to be converted.
:: #   %2: The full path to the **destination file**. Its drive, folder, 
:: #       and filename are used to construct the output path.
:: #
:: # Configuration (Encoding Parameters):
:: #   - Audio Codec: libmp3lame (MP3)
:: #   - Video Resolution: 640x480 (4:3)
:: #   - Video Framerate: 24 FPS
:: #   - Audio Bitrate: 128k
:: #   - Audio Sample Rate: 44100 Hz (Stereo)
:: #
:: # Output Path Construction:
:: #   The target file path is constructed from the drive (%~d2), path (%~p2), 
:: #   and name (%~n2) of the second argument, forcing the extension to `.avi`.
:: #
:: # Execution Flow:
:: #   The core FFmpeg command is executed by calling a script located at 
:: #   `./src/ffmpeg_call.bat`, passing the constructed input/output paths 
:: #   and encoding flags as arguments.
:: #
:: # Troubleshooting Note:
:: #   If playback on the target device is unsuccessful, it is recommended 
:: #   to change the resolution to 176:144 and the display aspect ratio 
:: #   (setdar) to 11:9 within the RESOLUTION and ENCODER_FLAGS variables.
:: #
:: # Dependencies:
:: #   1. FFmpeg must be installed and accessible via PATH (usually handled
:: #      within `ffmpeg_call.bat`).
:: #   2. The execution script `./src/ffmpeg_call.bat` must exist.
:: ##########################################################################
@echo off
set "CHANNELS=2" 
set "BITRATE=128k"
set "SAMPLERATE=44100" 
set "FPS=24"
set "RESOLUTION=176:144"
set "ENCODER_FLAGS=-hide_banner -loglevel error -codec:a libmp3lame -b:a %BITRATE% -ar %SAMPLERATE% -ac %CHANNELS% -filter:v fps=%FPS% -vf scale=%RESOLUTION%,setdar=4:3" 

set "DRIVE=%~d2"
set "FOLDER=%~p2"
set "FILENAME=%~n2"
set "NEW_FILEPATH=%DRIVE%%FOLDER%%FILENAME%.avi"
echo %NEW_FILEPATH%
ffmpeg -i %1 %ENCODER_FLAGS% -y "%NEW_FILEPATH%"