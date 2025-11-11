@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
:SHOW_HEADER
    ECHO AudioFileType-Converter for Nokia RM 1190 (128 kbps CBR) with FFmpeg
    ECHO Copyright 2025 - Justus Decker - GPL V3 License

SET MODE=%1
SET PATH=%2

IF "%MODE%"=="" (
    ECHO No mode given!
    GOTO :EOF
)

if "%MODE%"=="-h" (
    GOTO :SHOW_HELP
) ELSE (
    IF "%PATH%"=="" (
        ECHO No file given!
        GOTO :EOF
    )
)

:CHECK_FFMPEG_EXIST
    WHERE ffmpeg >NUL 2>NUL
    if ERRORLEVEL 1 (
        ECHO [ERROR] Cannot find: FFmpeg.exe.
        PAUSE 2>NUL
        GOTO :EOF
    )

:CREATE_DEST_FOLDER
    if not exist "%PATH%" (
        mkdir "%PATH%"
        echo [INFO] Destinationfolder: "%PATH%" created.
    )

:FOLDER
    GOTO :EOF
:FILE
    GOTO :EOF

:SHOW_HELP
    echo Modes:
    echo [-h] shows the help menu
    echo [-f] will run in folder mode
    echo [-s] will run in single file mode
    GOTO :EOF