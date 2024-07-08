@echo off
:: Check for administrative privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:main
cls
echo.
echo ================================
echo Hosts File Management Script
echo ================================
echo.
echo Please choose an option:
echo 1. Add URL to hosts file
echo 2. Remove URL from hosts file
echo 3. Show hosts file content
echo 4. Exit
echo.
set /p choice="Enter your choice (1/2/3/4): "

if "%choice%"=="1" goto add
if "%choice%"=="2" goto remove
if "%choice%"=="3" goto show
if "%choice%"=="4" goto end
goto main

:add
set /p url="Enter the URL to block (e.g., example.com): "
set "entry=127.0.0.1 %url%"

:: Check if the entry already exists
findstr /c:"%entry%" "%systemroot%\System32\drivers\etc\hosts" >nul
if %errorlevel%==0 (
    echo The URL %url% is already blocked.
) else (
    :: Append entry with elevated privileges
    echo %entry% | cmd /c "echo %entry% >> %systemroot%\System32\drivers\etc\hosts"
    echo The URL %url% has been added to the hosts file.
)
pause
goto main

:remove
set /p url="Enter the URL to unblock (e.g., example.com): "
set "entry=127.0.0.1 %url%"

:: Remove the entry if it exists
findstr /c:"%entry%" "%systemroot%\System32\drivers\etc\hosts" >nul
if %errorlevel%==0 (
    :: Remove entry with elevated privileges
    cmd /c "findstr /v /c:\"%entry%\" \"%systemroot%\System32\drivers\etc\hosts\" > \"%temp%\hosts\" && move /y \"%temp%\hosts\" \"%systemroot%\System32\drivers\etc\hosts\""
    echo The URL %url% has been removed from the hosts file.
) else (
    echo The URL %url% was not found in the hosts file.
)
pause
goto main

:show
type "%systemroot%\System32\drivers\etc\hosts"
pause
goto main

:end
exit
