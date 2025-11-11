# 📱 Nokiator
<img src="./icon.png" width="25%">

## AudioFileType-Converter (Nokia RM 1190 Edition)
This Batch script uses FFmpeg to convert MP3 files, ensuring a Constant Bit Rate (CBR) of 128 kbps. It is optimized for older hardware, especially the Nokia RM 1190.

🚀 Prerequisites

To run this script, FFmpeg must be available in your %SYSTEM_PATH% or located in the same folder as the Batch script.

The encoder parameters (e.g., for VBR/CBR quality) are controlled via the environment variable %ENCODER_FLAGS%, which you must set before starting the script.

### Recommended Flags for 128 kbps CBR:
```bash
SET ENCODER_FLAGS=-c:a libmp3lame -b:a 128k
```

> [!NOTE] 
> The script expects this variable to be set. If it is missing, the conversion will fail or use default settings.

## 🛠️ Usage

The script supports two operating modes: Single File (-s) or Entire Folder (-f).

> [!IMPORTANT]
> Due to the nature of Batch programming, any path containing spaces must be enclosed in double quotes ("...") when calling the script.

### Single File Mode (-s)

Converts a single MP3 file.

Example

```bash
converter.bat -s "C:\Users\Music\Bad Girls.mp3"
```

### Folder Mode (-f)

Converts all .mp3 files in the specified folder. The output folder (./convert) is created automatically.

Example

```bash
converter.bat -f "E:\My Albums"
```

📂 Output and Structure

All converted files are saved in the subfolder ./convert, which is located in the same directory as the Batch script. The original files remain unchanged.

* Output Structure:

```
converter.bat
/convert/
    ├─ Song A.mp3
    ├─ Song B.mp3
    └─ ...
```
### ❓ Show Help

To display the brief help page directly in the console:

```bash
converter.bat -h
```