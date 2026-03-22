@echo off
echo Running transformation...

cd /d %~dp0..
python python\transform.py

IF %ERRORLEVEL% NEQ 0 (
    echo Transformation failed!
    exit /b 1
)

echo Transformation completed successfully!
pause