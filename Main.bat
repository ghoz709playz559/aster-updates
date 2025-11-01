@echo off
title Aster Browser Updater
chcp 65001 >nul
cls

echo ╔══════════════════════════════════════════════════╗
echo ║             Aster Browser Updater                ║
echo ╚══════════════════════════════════════════════════╝
echo.
echo Checking for updates...
echo.

rem === CONFIGURATION ===
set "repodir=%~dp0source"
set "updaterepo=https://github.com/ghoz709playz559/aster-updates.git"
set "versionfile=%repodir%\version"
set "tempdir=%temp%\aster_update_check"
set "mainfile=%~dp0META-INF\data\main\main.bat"

rem === Ensure Git is available ===
where git >nul 2>nul || (
    echo [Error] Git is not installed or not in PATH.
    pause
    exit /b
)

rem === Read current version ===
set "localver=unknown"
if exist "%versionfile%" (
    set /p localver=<"%versionfile%"
)

rem === Quietly check for latest version ===
if exist "%tempdir%" rd /s /q "%tempdir%" >nul 2>nul
git clone --depth 1 "%updaterepo%" "%tempdir%" >nul 2>nul

if not exist "%tempdir%\version" (
    echo [Error] Unable to reach update server or invalid repository.
    echo Please check your internet connection.
    pause
    exit /b
)

set /p remotever=<"%tempdir%\version"
rd /s /q "%tempdir%" >nul 2>nul

rem === Compare versions ===
if "%localver%"=="%remotever%" (
    echo You already have the latest version: %localver%
) else (
    echo Update available! New version: %remotever%
    echo Downloading and applying update...
    cd /d "%repodir%"
    git pull origin main >nul 2>nul
    echo %remotever%>"%versionfile%"
    echo Update complete!
)

echo.
echo Launching Aster Browser...
echo.

rem === Launch main program ===
if exist "%mainfile%" (
    start "" "%mainfile%"
) else (
    echo [Error] Could not find main file:
    echo %mainfile%
)

echo.
pause
exit /b
