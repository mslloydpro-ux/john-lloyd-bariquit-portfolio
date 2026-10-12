@echo off
setlocal
cd /d "%~dp0"

where py >nul 2>nul
if errorlevel 1 goto use_python

start "Portfolio local server" /D "%~dp0" py -3 -m http.server 8000 --bind 127.0.0.1
goto open_site

:use_python
where python >nul 2>nul
if errorlevel 1 goto no_python
start "Portfolio local server" /D "%~dp0" python -m http.server 8000 --bind 127.0.0.1
goto open_site

:no_python
echo Python 3 is required to start the local preview. Install Python, then run this file again.
pause
exit /b 1

:open_site
timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:8000/"
