@echo off
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyMMdd"') do set commit_message=%%i
echo Commit message: %commit_message%
git add .
git commit -m "%commit_message%"