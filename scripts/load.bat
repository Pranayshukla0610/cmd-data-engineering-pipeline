@echo off

echo Setting PostgreSQL path...

for /d %%D in ("C:\Program Files\PostgreSQL\*") do (
    set PG_PATH=%%D\bin
)

set PATH=%PG_PATH%;%PATH%

cd /d %~dp0..

echo Current directory:
cd

echo Checking SQL file...
dir sql

echo Loading data into PostgreSQL...

psql -U postgres -d ecommerce -f "%CD%\sql\create_tables.sql"

psql -U postgres -d ecommerce -c "\COPY olist_data FROM '%CD%\data\processed\cleaned_olist.csv' DELIMITER ',' CSV HEADER;"
IF %ERRORLEVEL% NEQ 0 (
    echo Load failed!
    exit /b 1
)

echo Data loaded successfully!
pause