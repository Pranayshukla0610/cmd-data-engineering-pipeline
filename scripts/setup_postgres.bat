@echo off
echo Setting up PostgreSQL PATH...

REM Find PostgreSQL version folder
for /d %%D in ("C:\Program Files\PostgreSQL\*") do (
    set PG_PATH=%%D\bin
)

REM Add to PATH temporarily
set PATH=%PG_PATH%;%PATH%

echo PostgreSQL path set to: %PG_PATH%

REM Test psql
psql --version

IF %ERRORLEVEL% NEQ 0 (
    echo Failed to detect psql!
    exit /b 1
)

echo PostgreSQL is ready!