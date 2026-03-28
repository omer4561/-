@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ============================================
echo   Fitness and Nutrition App - Installer
echo ============================================
echo.

:: Ask user for port
set /p PORT="Enter port number (default: 3000): "
if "!PORT!"=="" set PORT=3000

echo.
echo Starting server on port !PORT!...
echo.

:: Try Python first
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Python found - using Python HTTP server.
    echo Opening http://localhost:!PORT! ...
    start /b cmd /c "timeout /t 2 >nul && start http://localhost:!PORT!"
    python -m http.server !PORT! --directory "%~dp0"
    goto :done
)

:: Try Python3
where python3 >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Python3 found - using Python HTTP server.
    start /b cmd /c "timeout /t 2 >nul && start http://localhost:!PORT!"
    python3 -m http.server !PORT! --directory "%~dp0"
    goto :done
)

:: Try Node.js / npx
where node >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Node.js found - using npx serve.
    start /b cmd /c "timeout /t 3 >nul && start http://localhost:!PORT!"
    npx --yes serve "%~dp0" -p !PORT!
    goto :done
)

:: Nothing found - open file directly
echo [WARN] No server found. Opening index.html directly in browser.
start "" "%~dp0index.html"

:done
endlocal
