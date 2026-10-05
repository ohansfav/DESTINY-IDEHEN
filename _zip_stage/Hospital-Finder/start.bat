@echo off
setlocal

cd /d "%~dp0frontend"

where pnpm >nul 2>nul
if %errorlevel%==0 (
    if not exist node_modules (
        echo Installing dependencies with pnpm...
        call pnpm install
    )
    call pnpm dev
) else (
    if not exist node_modules (
        echo Installing dependencies with npm...
        call npm install
    )
    call npm run dev
)

endlocal
