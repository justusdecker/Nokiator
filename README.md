# 📱 Nokiator File-Converter
<img src="./icon.png" width="25%">

An optimized Batch script wrapper around FFmpeg designed to convert media files into formats strictly compatible with the `Nokia RM 1190` device.

#### 🎧 Audio Playback
<img src="./data/audio_is_playing.png" width="25%">

Also long audio playback is possible

<img src="./data/audio_is_playing_long.png" width="25%">

#### 🎧 Video Playback
<img src="./data/video(screenshot).png" width="25%">

## ✨ Features & Specifications
This utility ensures maximum compatibility by converting media to the `Nokia RM 1190's` native formats:
* **Batch & Single File Modes:** Use -f for folder conversion or -s for a single file.
* **Target Output:** All converted files are saved to the dedicated ./convert output directory.
* **Audio Optimization:** Converts to Mono audio at a low sampling rate (using libmp3lame) for resource-constrained playback.
* **Video Optimization:** Converts to `176x144` resolution at `12` FPS (using mpeg4 codec) to match the native video recorder specifications.
* **Image Optimization:** Handles conversion and scaling (defaulting to `640x144` max) for images.

## ⚠️ Prerequisites
This project is a wrapper and requires the FFmpeg binary to function. Ensure that FFmpeg is accessible by the helper scripts within the ./src directory.

The project must maintain the following file structure:

    .
    ├── nokiator.bat
    └── src
        ├── ffmpeg_audio.bat    (Audio encoding helper)
        ├── ffmpeg_video.bat    (Video encoding/scaling helper)
        ├── ffmpeg_image.bat    (Image conversion helper)
        └── show_help.bat       (Usage guide)

## 📂 Output

All converted files are saved in the subfolder ./convert, which is located in the same directory as the Batch script. The original files remain unchanged.

```
converter.bat
/convert/
    ├─ Song A.mp3
    ├─ Song B.mp3
    └─ ...
```

## 🛠️ Usage
The script is executed using three required arguments: Mode, Output Type, and the Input Path.

Call Format:
```bash
nokiator.bat [MODE] [TYPE] "PATH"
```

> [!IMPORTANT]
> Paths containing spaces MUST be enclosed in double quotes ("").

### Mode Options
|Option|Description|
|---|---|
|-h|Shows the help menu(`./src/show_help.bat`)
|-f|Folder Mode: Converts ALL supported input files in the given `PATH`.|
|-s|Single File Mode: Converts the specific single file `PATH`.|

### Supported Formats(WIP)

* `.mp3` 44.1kHz Stereo 128kbit/s ✔
* `.avi` 176x144 24fps 4:3 44.1kHz Stereo 128kbit/s ✔
* `jpg` 640x480 24bit 96dpi 🕐

After the compatibility check, we will test the maximum audio & video_length.

> [!NOTE]
> * ✔ Works just fine
> * 🕐 Pending

### 🚀 Examples

|Scenario|Command|Result|
|---|---|---|
|Folder Mode(Audio)|`nokiator.bat -f mp3 "C:\My Music"`|Searches for all .mp3 files and converts them to .mp3 (optimized audio).|
|Folder Mode (Video)|`nokiator.bat -f mp4 ".\raw_videos"`|Searches for all .avi files and converts them to .mp4 (optimized video).|
|Single File Mode (Image)|`nokiator.bat -s png "C:\Pics\Vacation.bmp"`|Converts Vacation.bmp to .png (optimized image size).|


Copyright 2025 - Justus Decker | Licensed under the GPL V3 License.

# Specs of the Nokia RM 1190 / Nokia 150
|Spec|Value|
|---|---|
|First released|13 December 2016|
|Manufacturer|Foxconn|
|Developer|HMD Global|
|OS|Nokia Series 30+|
|Weight|81g (2.86 oz)|
|Removable Storage|Up to 32GB MicroSDHC|
|Battery|1020 mAh Li-Ion(600h Stand-By, 22 Hours Call-Time)|
|Display|2.4" LCD 320x240 (167 ppi)|
|Sound|3.5mm AV Jack, speaker|
|Connectivity| Bluetooth 3.0, USB 2.0 micro-B, FM-Radio|
|Other|Flashlight LED|
|Camera| 0.3MP|
|Price(around 2016)|30-40€|
|Price(2025)|50-150€|