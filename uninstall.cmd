@echo off
setlocal

set REPO_DIR=%~dp0
if "%REPO_DIR:~-1%"=="\" set REPO_DIR=%REPO_DIR:~0,-1%
set UNINSTALLER=%REPO_DIR%\uninstall

where bash >nul 2>nul
if not errorlevel 1 (
  bash "%UNINSTALLER%" %*
  exit /b %errorlevel%
)

for %%P in (
  "C:\Program Files\Git\bin\bash.exe"
  "C:\Program Files (x86)\Git\bin\bash.exe"
) do (
  if exist %%P (
    %%P "%UNINSTALLER%" %*
    exit /b %errorlevel%
  )
)

echo Bash is required to run the gstack uninstaller.
echo Install Git for Windows (which includes bash): https://git-scm.com/
echo Or use WSL and run: ./uninstall.sh
exit /b 1
