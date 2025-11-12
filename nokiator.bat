::AudioFileType-Converter for Nokia RM 1190 (128 kbps CBR) with FFmpeg
::Copyright 2025 - Justus Decker - GPL V3 License
::
::This script converts MP3 files using the parameters defined in %ENCODER_FLAGS%.
::
::Call Format:
::converter.bat [MODE] "PATH"
::
::IMPORTANT: Paths containing spaces MUST be enclosed in double quotes ("")!
::
::Mode Options:
::[-h]    Shows this help menu.
::[-f]    Folder Mode: Converts ALL MP3s in the specified PATH.
::PATH: The full path to the input folder (without a trailing slash).
::Example: converter.bat -f "C:\Music"
::
::[-s]    Single File Mode: Converts the specified single MP3 file.
::PATH: The full path to the input file.
::Example: converter.bat -s "C:\Music\Song A.mp3"
::
::Output: All converted files are saved in the './convert' subfolder.

@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:SHOW_HEADER
    ECHO Nokiator File-Converter for Nokia RM 1190 with FFmpeg
    ECHO Copyright 2025 - Justus Decker - GPL V3 License

:TRACE_ARGS
    SET MODE=%1
    SET TYPE=%2
    SET PATH=%3

:VALIDATE_ARGUMENTS
    SET /a NOT_SET=0
    IF "%MODE%"=="" SET /a NOT_SET+=1
    IF "%MODE%"=="-h" GOTO :SHOW_HELP
    IF "%TYPE%"=="" SET /a NOT_SET+=2
    IF %PATH%=="" SET /a NOT_SET+=4

    IF %NOT_SET%==3 echo No File given! && GOTO :EOF

:SET_FORMAT
    IF "%TYPE%"=="mp3" SET "OUT_FORMAT=.mp3" && SET "SEARCH_FORMAT=.mp3" && SET "CALLBACK=./src/ffmpeg_audio.bat"
    IF "%TYPE%"=="ogg" SET "OUT_FORMAT=.ogg" && SET "SEARCH_FORMAT=.mp3" && SET "CALLBACK=./src/ffmpeg_audio.bat"

    IF "%TYPE%"=="mp4" SET "OUT_FORMAT=.mp4" && SET "SEARCH_FORMAT=.avi" && SET "CALLBACK=./src/ffmpeg_video.bat"
    IF "%TYPE%"=="mov" SET "OUT_FORMAT=.mov" && SET "SEARCH_FORMAT=.avi" && SET "CALLBACK=./src/ffmpeg_video.bat"
    IF "%TYPE%"=="avi" SET "OUT_FORMAT=.avi" && SET "SEARCH_FORMAT=.avi" && SET "CALLBACK=./src/ffmpeg_video.bat"

    IF "%TYPE%"=="png" SET "OUT_FORMAT=.png" && SET "SEARCH_FORMAT=.jpg" && SET "CALLBACK=./src/ffmpeg_image.bat"
    IF "%TYPE%"=="jpg" SET "OUT_FORMAT=.jpg" && SET "SEARCH_FORMAT=.jpg" && SET "CALLBACK=./src/ffmpeg_image.bat"
    IF "%TYPE%"=="jpeg" SET "OUT_FORMAT=.jpeg" && SET "SEARCH_FORMAT=.jpg" && SET "CALLBACK=./src/ffmpeg_image.bat"

:CREATE_DEST_FOLDER
    if NOT EXIST "./convert" (
        MKDIR "./convert"
        ECHO [INFO] Destinationfolder: "./convert" created.
    )

IF "%MODE%"=="-s" GOTO :FILE
IF "%MODE%"=="-f" GOTO :FOLDER

:MODE_NOT_RECOGNIZED
    ECHO [ERROR] Unrecognized mode: "%MODE%"
    GOTO :EOF

:FOLDER
    ECHO.
    if NOT EXIST "%PATH%" (
        ECHO [ERROR] Inputfolder does not exist
        goto :EOF
    )

    ECHO [INFO] Start convert all MP3s in "%PATH%"...
    SET /a COUNT=0

    FOR %%f IN ("%PATH%/*%SEARCH_FORMAT%") do (
        SET /a COUNT+=1
        ECHO.
        ECHO [CONV] Convert File !COUNT!: "%%~nxf"
        
        call %CALLBACK% "%PATH%/%%~nf.mp3" "./convert/%%~nf%OUT_FORMAT%"
        
        IF ERRORLEVEL 1 (
            ECHO [ERROR] Error while converting "%%~nxf"!
        ) ELSE (
            ECHO [OK] Convert successfull.
        )
    )

    ECHO.
    ECHO Finished batch
    ECHO Results are saved in "'./convert'"
    ECHO Press any Key to close!
    PAUSE 2>NUL
    goto :EOF

:FILE
    ECHO.
    IF NOT EXIST %PATH% (
        ECHO [ERROR] File does not exist or path is not valid. "%PATH%"
        GOTO :EOF
    )

    ECHO [INFO] Start converting "%PATH%"...
    
    call %CALLBACK% %PATH% "./convert/%~n3%OUT_FORMAT%"

    IF ERRORLEVEL 1 (
        ECHO [ERROR] Failed converting: "%PATH%"!
    ) ELSE (
        ECHO [OK] Convert successfull.
        ECHO.
        ECHO [INFO] Convert file: "./convert/%~n3.mp3"
    )

    PAUSE 2>NUL
    GOTO :EOF

:SHOW_HELP
    CALL ./src/show_help.bat
    GOTO :EOF