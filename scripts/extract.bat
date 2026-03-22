@echo off
setlocal enabledelayedexpansion

echo Extracting files...

cd data\raw

set COUNT=0

for %%f in (*.csv) do (
    echo Found file: %%f
    set /a COUNT+=1
)

echo Total files found: !COUNT!

IF !COUNT! EQU 0 (
    echo No CSV files found!
    exit /b 1
)

echo Extraction complete!
pause