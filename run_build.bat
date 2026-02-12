@echo off
echo Running flutter pub get...
call flutter pub get > build_log.txt 2>&1
if %errorlevel% neq 0 (
  echo Error running pub get >> build_log.txt
  exit /b %errorlevel%
)

echo Running build_runner...
call flutter pub run build_runner build --delete-conflicting-outputs >> build_log.txt 2>&1
if %errorlevel% neq 0 (
  echo Error running build_runner >> build_log.txt
  exit /b %errorlevel%
)

echo Build successful >> build_log.txt
