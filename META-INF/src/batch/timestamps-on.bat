@echo off
REM Head
title Aster Browser Downloader
chcp 65001 >nul
set gitdir=C:\Program Files\Git\cmd\git.exe
set USER=%USERNAME%
setlocal
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

echo Enabled Timestamps.
timeout 3 >nul

:Head
cls
title Script Options
echo ╔═════════════════════════════════════════════╗
echo ║                Script Options               ║
echo ╚═════════════════════════════════════════════╝
echo.
echo [1] Disable Timestamps
echo [2] Continue
echo [3] Exit
echo.
set /p input="%USER%@aster-setup ~$ "
if /i "%input%"=="1" goto script1
if /i "%input%"=="2" goto body
if /i "%input%"=="3" exit

REM Body
:body
cls
title Aster Browser Downloader
echo ╔══════════════════════════════════════════════════════╗
echo ║                Git Directory Selection               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo [%TIME%] Please select a GIT option.
echo.
type assets\body\menu\main.dll
echo.
set /p input="%USER%@aster-setup ~$ "
if /i "%input%"=="1" goto gitdir1
if /i "%input%"=="2" goto gitdir2
if /i "%input%"=="3" exit

:gitdir1
if exist "%gitdir%" (
    goto menu
) else (
    cls
    echo [%TIME%] Unable to find GIT in default location, Please select [2] if the location is different.
    goto body
)

:gitdir2
cls
title Custom Git Directory Selection
echo ╔═════════════════════════════════════════════════════════════╗
echo ║                Custom Git Directory Selection               ║
echo ╚═════════════════════════════════════════════════════════════╝
echo.
echo [%TIME%] Please Enter the Custom directory of the GIT.
echo.
set /p input2="%USER%@aster-setup ~$ "
if exist "%input2%" goto menu
echo [%TIME%] The directory "%input2%" cannot be found!
echo [%TIME%] Please select a valid one.
goto body

:menu
title Aster Browser Downloader
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║               Aster Browser Downloader               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo [%TIME%] Downloading Latest Aster Browser...

rem === set your download URL and output file ===
set "url=https://www.dropbox.com/scl/fi/aa9nfed2573tptin36w9w/Aster-Browser-Setup.exe?rlkey=zkswan775a4ez2411kwjwpusp&e=1&st=yc9r6t4f&dl=1"
set "output=Aster Browser.exe"

rem === run curl silently in background ===
curl -L "%url%" -o "%output%"
echo [%TIME%] Download Complete.
if errorlevel 1 goto error2
set /p enter1="Press [Enter] to exit"
goto exit


:exit
title Exit Script Confirmation
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║               Exit Script Confirmation               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo [%TIME%] Do you want to exit script?
echo.
set /p input3="%USER%@aster-setup ~$ "
if /i "%input%"=="Y" goto bye
if /i "%input%"=="N" goto menu

:bye
cls
echo ╔══════════════════════════════════════════════╗
echo ║               Thanks for using               ║
echo ╚══════════════════════════════════════════════╝
echo.
echo [%TIME%] Thank you for using my script. If you need any help, Please contact my email:
echo [%TIME%] narwayneaquino@gmail.com. You may select the Auto-Update option in start.
timeout 3 >nul
exit

:error2
cls
title Error Data Fetching
echo ╔══════════════════════════════════════════════════════╗
echo ║               Aster Browser Downloader               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo [%TIME%] Unable to download Aster Browser.exe
echo [%TIME%] Error Code: 305
echo [%TIME%] Error Label: Client Side cannot be able to fetch. Check your internet speed or try again.
set /p enter2="Press [Enter] to Exit"
goto exit

:script1
title Client Side
echo Disabling Timestamps...
timeout 3 >nul
start Main.bat
exit
