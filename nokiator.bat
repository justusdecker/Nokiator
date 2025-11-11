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
    ECHO AudioFileType-Converter for Nokia RM 1190 (128 kbps CBR) with FFmpeg
    ECHO Copyright 2025 - Justus Decker - GPL V3 License

SET MODE=%1
SET PATH=%2


IF "%MODE%"=="" (
    GOTO :SHOW_HELP
)

if "%MODE%"=="-h" (
    GOTO :SHOW_HELP
) ELSE (
    IF %PATH%=="" (
        ECHO No file given!
        GOTO :EOF
    )
)

:CREATE_DEST_FOLDER
    if NOT EXIST "./convert" (
        MKDIR "./convert"
        ECHO [INFO] Destinationfolder: "./convert" created.
    )

IF "%MODE%"=="-s" GOTO FILE
IF "%MODE%"=="-f" (
    GOTO :FOLDER
) ELSE (
    ECHO [ERROR] Unrecognized mode: "%MODE%"
    GOTO :EOF
)

:FOLDER
    ECHO.
    if NOT EXIST "%PATH%" (
        ECHO [ERROR] Inputfolder does not exist
        goto :EOF
    )

    ECHO [INFO] Start convert all MP3s in "%PATH%"...
    SET /a COUNT=0

    FOR %%f IN ("%PATH%/*.mp3") do (
        SET /a COUNT+=1
        ECHO.
        ECHO [CONV] Convert File !COUNT!: "%%~nxf"

        ffmpeg -i "%PATH%/%%~nf.mp3" %ENCODER_FLAGS% -y "./convert/%%~nf.mp3"
        
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
    echo %~nf2
    ffmpeg -i %PATH% %ENCODER_FLAGS% -y "./convert/%~n2.mp3"

    IF ERRORLEVEL 1 (
        ECHO [ERROR] Failed converting: "%PATH%"!
    ) ELSE (
        ECHO [OK] Convert successfull.
        ECHO.
        ECHO [INFO] Convert file: "./convert/%~n2.mp3"
    )

    PAUSE 2>NUL
    GOTO :EOF

:SHOW_HELP
    ECHO Modes:
    ECHO [-h] shows the help menu
    ECHO [-f] will run in folder mode
    ECHO [-s] will run in single file mode
    ECHO FILE/FOLDER "FORMAT":
    ECHO Folderpaths must be "C:/Users" not "C:/Users/"
    ECHO Filepaths must be "C:/Users/Music/Bad Girls.mp3"
    ECHO Must be given in parentheses
    GOTO :EOF