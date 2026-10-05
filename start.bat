@echo off
setlocal

set "REPO_DIR=%~dp0Hospital-Finder"

if not exist "%REPO_DIR%\start.bat" (
    echo Could not find "%REPO_DIR%\start.bat".
    exit /b 1
)

cd /d "%REPO_DIR%"
call .\start.bat

endlocal
