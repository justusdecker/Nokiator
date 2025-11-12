:: This will run your ffmpeg command
:: Arguments
:: %1 inputFile
:: %2 outputFile
:: %3 EncoderFlags

echo Started converting %1 to %2
if NOT %3=="" (
    echo ENCODER_FLAGS: %3
)

ffmpeg -i %1 %3 -y %2