@echo off
setlocal

echo ===============================
echo Hospital Finder Setup Installer
echo ===============================
echo.

cd /d "%~dp0frontend"

where node >nul 2>nul
if not %errorlevel%==0 (
    echo [ERROR] Node.js is not installed or not available in PATH.
    echo Please install Node.js LTS from https://nodejs.org and run this file again.
    pause
    exit /b 1
)

where pnpm >nul 2>nul
if %errorlevel%==0 (
    echo Installing dependencies with pnpm...
    call pnpm install
    if not %errorlevel%==0 (
        echo [ERROR] pnpm install failed.
        pause
        exit /b 1
    )
) else (
    echo pnpm not found. Falling back to npm...
    echo Installing dependencies with npm...
    call npm install
    if not %errorlevel%==0 (
        echo [ERROR] npm install failed.
        pause
        exit /b 1
    )
)

echo.
echo Installation complete.
echo Next step: run start.bat in the project root.
echo.
pause
endlocal
