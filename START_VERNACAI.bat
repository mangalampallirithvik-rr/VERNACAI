@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title VERNACAI - Local Demo

if not exist package.json (
  echo ERROR: package.json not found.
  pause
  exit /b 1
)

where node >nul 2>&1
if errorlevel 1 (
  echo.
  echo Node.js is not installed.
  echo Please install Node.js LTS from https://nodejs.org/ and run this file again.
  pause
  exit /b 1
)

where npm >nul 2>&1
if errorlevel 1 (
  echo.
  echo npm is not available. Please reinstall Node.js LTS and try again.
  pause
  exit /b 1
)

echo.
echo ==========================================
echo             VERNACAI LOCAL
echo ==========================================
echo.

REM Repair an incomplete/corrupt dependency folder from an interrupted install.
if not exist "node_modules\react\index.js" (
  if exist node_modules (
    echo Repairing incomplete node_modules folder...
    rmdir /s /q node_modules
  )
  echo Installing dependencies. Please wait...
  call npm.cmd install --no-audit --no-fund
  if errorlevel 1 goto install_failed
)

REM Verify the key runtime packages before starting Vite.
if not exist "node_modules\react\index.js" goto install_failed
if not exist "node_modules\react-dom\client.js" goto install_failed
if not exist "node_modules\vite\bin\vite.js" goto install_failed

echo.
echo Starting VERNACAI...
start "VERNACAI SERVER" /min cmd /c "npm.cmd run dev"

echo Waiting for the local server...
set /a tries=0
:wait
set /a tries+=1
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { $r=Invoke-WebRequest -UseBasicParsing http://127.0.0.1:5173 -TimeoutSec 2; if($r.StatusCode -eq 200){exit 0}else{exit 1} } catch { exit 1 }" >nul 2>&1
if not errorlevel 1 (
  start "" "http://127.0.0.1:5173/"
  echo.
  echo VERNACAI is running at http://127.0.0.1:5173/
  exit /b 0
)
if %tries% GEQ 30 goto server_failed
timeout /t 1 /nobreak >nul
goto wait

:install_failed
echo.
echo ERROR: Dependencies could not be installed correctly.
echo Please check your internet connection and run START_VERNACAI.bat again.
echo.
pause
exit /b 1

:server_failed
echo.
echo ERROR: VERNACAI did not start on port 5173.
echo The server window may contain the exact error message.
echo.
pause
exit /b 1
