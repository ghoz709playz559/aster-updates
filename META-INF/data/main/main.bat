@echo off
REM Head
title Aster Browser Downloader
chcp 65001 >nul
set gitdir=C:\Program Files\Git\cmd\git.exe
set USER=%USERNAME%
setlocal
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

:Head
title Script Options
echo ╔═════════════════════════════════════════════╗
echo ║                Script Options               ║
echo ╚═════════════════════════════════════════════╝
echo.
echo [1] Enable Timestamps
echo [2] Continue
echo [3] Exit
echo [N] I Love Pra
echo.
set /p input="%USER%@aster-setup ~$ "
if /i "%input%"=="1" goto script1
if /i "%input%"=="2" goto body
if /i "%input%"=="3" exit
if /i "%input%"=="N" cls && Ilove pratech

REM Body
:body
cls
title Aster Browser Downloader
echo ╔══════════════════════════════════════════════════════╗
echo ║                Git Directory Selection               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo Please select a GIT option.
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
    echo Unable to find GIT in default location, Please select [2] if the location is different.
    goto body
)

:gitdir2
cls
title Custom Git Directory Selection
echo ╔═════════════════════════════════════════════════════════════╗
echo ║                Custom Git Directory Selection               ║
echo ╚═════════════════════════════════════════════════════════════╝
echo.
echo Please Enter the Custom directory of the GIT.
echo.
set /p input2="%USER%@aster-setup ~$ "
if exist "%input2%" goto menu
echo The directory "%input2%" cannot be found!
echo Please select a valid one.
goto body

:menu
title Aster Browser Downloader
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║               Aster Browser Downloader               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo Downloading Latest Aster Browser...

rem === set your download URL and output file ===
set "url=https://www.dropbox.com/scl/fi/aa9nfed2573tptin36w9w/Aster-Browser-Setup.exe?rlkey=zkswan775a4ez2411kwjwpusp&e=1&st=yc9r6t4f&dl=1"
set "output=Aster Browser.exe"

rem === run curl silently in background ===
curl -L "%url%" -o "%output%"
echo Download Complete.
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
echo Do you want to exit script?
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
echo Thank you for using my script. If you need any help, Please contact my email:
echo narwayneaquino@gmail.com. You may select the Auto-Update option in start.
timeout 3 >nul
exit

:error2
cls
title Error Data Fetching
echo ╔══════════════════════════════════════════════════════╗
echo ║               Aster Browser Downloader               ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo Unable to download Aster Browser.exe
echo Error Code: 305
echo Error Label: Client Side cannot be able to fetch. Check your internet speed or try again.
echo Error log has been saved in logs/error-log.log

rem --- Create logs folder if missing ---
if not exist logs mkdir logs

rem --- Write temporary log files ---
echo Aster Browser Error Log> logs\temp1.txt
echo Time: %TIME%> logs\temp2.txt
echo Error Code: 305> logs\temp3.txt
echo Error Label: Client Side cannot be able to fetch. Check your internet speed or try again> logs\temp4.txt
echo Technical Code: 0x97e000f> logs\temp5.txt
echo (Send this error log to Aster Technical Support)> logs\temp6.txt

rem --- Merge them safely ---
copy /b logs\temp1.txt+logs\temp2.txt+logs\temp3.txt+logs\temp4.txt+logs\temp5.txt+logs\temp6.txt logs\error-log.log >nul

rem --- Clean up ---
del logs\temp1.txt logs\temp2.txt logs\temp3.txt logs\temp4.txt logs\temp5.txt logs\temp6.txt >nul

set /p enter2="Press [Enter] to Exit"
exit

:script1
title Client Side
echo Enabling Timestamps...
timeout 3 >nul
start META-INF\src\batch\timestamps-on.bat
exit
