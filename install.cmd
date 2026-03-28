@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ============================================
echo   Claude Code - Windows Installer
echo ============================================
echo.

:: Check for Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed.
    echo Please install Node.js from https://nodejs.org/ and re-run this script.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo [OK] Node.js found: !NODE_VERSION!

:: Check for npm
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] npm is not installed.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo [OK] npm found: !NPM_VERSION!
echo.

:: Install Claude Code globally
echo Installing Claude Code...
npm install -g @anthropic-ai/claude-code

if %errorlevel% neq 0 (
    echo [ERROR] Installation failed.
    pause
    exit /b 1
)

echo.
echo ============================================
echo   Claude Code installed successfully!
echo   Run: claude
echo ============================================
echo.

endlocal
