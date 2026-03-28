@echo off
setlocal

echo === אפליקציית כושר ותזונה - התקנה ===
echo.

:: Check for Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed.
    echo Please install Node.js from https://nodejs.org/ and re-run this script.
    pause
    exit /b 1
)

echo [OK] Node.js found.

:: Check if index.html exists
if not exist "%~dp0index.html" (
    echo [ERROR] index.html not found in the current directory.
    pause
    exit /b 1
)

echo [OK] index.html found.
echo.
echo Starting local web server...
echo The app will open at http://localhost:3000
echo Press Ctrl+C to stop the server.
echo.

:: Open browser after a short delay
start /b cmd /c "timeout /t 2 >nul && start http://localhost:3000"

:: Serve using npx serve
npx --yes serve "%~dp0" -p 3000 -s

endlocal
