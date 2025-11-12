ECHO.
    ECHO ##########################################################################
    ECHO # Audio/Video/Image File Converter for Nokia RM 1190
    ECHO ##########################################################################
    ECHO Copyright 2025 - Justus Decker - GPL V3 License
    ECHO.
    ECHO This script converts media files using FFmpeg, optimized for the Nokia RM 1190.
    ECHO All converted files are saved in the "./convert" subfolder.
    ECHO.
    ECHO Call Format:
    ECHO converter.bat [MODE] [TYPE] "PATH"
    ECHO.
    ECHO IMPORTANT: Paths containing spaces MUST be enclosed in double quotes ("")!
    ECHO.
    ECHO --------------------------------------------------------------------------
    ECHO 1. Mode Options [MODE]
    ECHO --------------------------------------------------------------------------
    ECHO [-h]    Shows this help menu.
    ECHO [-f]    Folder Mode: Converts ALL supported files of the specified [TYPE]
    ECHO         in the given path.
    ECHO [-s]    Single File Mode: Converts the specified single file.
    ECHO.
    ECHO --------------------------------------------------------------------------
    ECHO 2. Target Format Options [TYPE]
    ECHO --------------------------------------------------------------------------
    ECHO This defines the desired INPUT FORMAT and the conversion type to use.
    ECHO.
    ECHO Audio (Uses ffmpeg_audio.bat):
    ECHO [mp3]   Input Format: .mp3 to .mp3
    ECHO [ogg]   Input Format: .ogg to .mp3
    ECHO.
    ECHO Video (Uses ffmpeg_video.bat):
    ECHO [avi]   Input Format: .avi to .mp4
    ECHO [mp4]   Input Format: .mp4 to .mp4
    ECHO [mov]   Input Format: .mov to .mp4
    ECHO.
    ECHO Image (Uses ffmpeg_image.bat):
    ECHO [jpg]   Input Format: .jpg to .jpg
    ECHO [png]   Input Format: .png to .jpg
    ECHO [jpeg]  Input Format: .jpeg to .jpg
    ECHO.
    ECHO --------------------------------------------------------------------------
    ECHO 3. Path Examples ["PATH"]
    ECHO --------------------------------------------------------------------------
    ECHO.
    ECHO Example 1 (Folder Mode -f):
    ECHO ... Converts all MP3s in "C:\My Music" to ./convert/*.mp3
    ECHO converter.bat -f mp3 "C:\My Music"
    ECHO.
    ECHO Example 2 (Single File Mode -s):
    ECHO ... Converts "C:\Videos\Movie.mkv" to ./convert/Movie.avi
    ECHO converter.bat -s avi "C:\Videos\Movie.mkv"
    ECHO.
    ECHO Example 3 (Help):
    ECHO converter.bat -h
    ECHO.