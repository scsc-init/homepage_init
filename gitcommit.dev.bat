@echo off
set /p commit_message="Commit message: "
git add .
git commit -m "%commit_message%"