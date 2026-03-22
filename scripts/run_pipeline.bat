@echo off

set LOG=logs\pipeline.log

echo ============================== >> %LOG%
echo Pipeline started at %date% %time% >> %LOG%

call scripts\setup_postgres.bat >> %LOG% 2>&1
call scripts\transform.bat >> %LOG% 2>&1
call scripts\load.bat >> %LOG% 2>&1

IF %ERRORLEVEL% NEQ 0 (
    echo Pipeline failed at %date% %time% >> %LOG%
    exit /b 1
)

echo Pipeline completed successfully at %date% %time% >> %LOG%
echo ============================== >> %LOG%

echo Pipeline executed successfully!
pause