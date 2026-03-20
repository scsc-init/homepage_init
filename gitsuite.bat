@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Stage all changes
git add .

rem Commit message selection
echo "Select commit message:"
echo "  1) Meeting note on MM.DD.YYYY"
echo "  2) Enter manually"
set /p _cmode=Choice (1/2): 

set "commit_msg="
if "%_cmode%"=="1" (
  for /f %%i in ('wmic os get LocalDateTime ^| find "."') do set dt=%%i
  set "YYYY=!dt:~0,4!"
  set "MM=!dt:~4,2!"
  set "DD=!dt:~6,2!"
  set "commit_msg=Meeting note on !MM!.!DD!.!YYYY!"
) else if "%_cmode%"=="2" (
  set /p commit_msg=Enter commit message: 
) else (
  echo Invalid choice. Aborting.
  exit /b 1
)

if not defined commit_msg (
  echo Empty commit message. Aborting.
  exit /b 1
)

rem Commit
git commit -m "%commit_msg%"
if errorlevel 1 (
  echo Commit failed. Aborting.
  exit /b 1
)

rem Push decision
set /p _push="Push now? [Y/n]: "
if /I "%_push%"=="y" goto do_push
if /I "%_push%"=="t" goto do_push
if "%_push%"=="1" goto do_push
if "%_push%"=="" goto do_push

echo Done (commit only).
exit /b 0

:do_push
git push
if errorlevel 1 (
  echo Push failed.
  exit /b 1
)
echo Done (commit + push).
exit /b 0