@echo off
setlocal

set REPO_DIR=%~dp0
if "%REPO_DIR:~-1%"=="\" set REPO_DIR=%REPO_DIR:~0,-1%
set SETUP=%REPO_DIR%\setup

where bash >nul 2>nul
if not errorlevel 1 (
  bash "%SETUP%" %*
  exit /b %errorlevel%
)

for %%P in (
  "C:\Program Files\Git\bin\bash.exe"
  "C:\Program Files (x86)\Git\bin\bash.exe"
) do (
  if exist %%P (
    %%P "%SETUP%" %*
    exit /b %errorlevel%
  )
)

echo Bash is required to run the gstack installer.
echo Install Git for Windows (which includes bash): https://git-scm.com/
echo Or use WSL and run: ./install.sh
exit /b 1
