@echo off

echo Starting PostgreSQL service...

net start postgresql-x64-16

IF %ERRORLEVEL% NEQ 0 (
    echo Trying alternative service name...
    net start postgresql
)

echo Waiting for PostgreSQL to be ready...
timeout /t 5 >nul

echo Checking connection...
psql -U postgres -c "\l"

IF %ERRORLEVEL% NEQ 0 (
    echo PostgreSQL still not ready!
    exit /b 1
)

echo PostgreSQL is running!