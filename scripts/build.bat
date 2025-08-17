@echo off
REM Build script for FreeCodeVeda (Windows)
REM This script builds both frontend and backend for production

echo 🚀 Starting build process...

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed. Please install Node.js 18+ first.
    exit /b 1
)

REM Check Node.js version
for /f "tokens=1,2 delims=." %%a in ('node -v') do set NODE_VERSION=%%a
set NODE_VERSION=%NODE_VERSION:~1%
if %NODE_VERSION% lss 18 (
    echo [ERROR] Node.js version 18+ is required. Current version: 
    node -v
    exit /b 1
)

echo [INFO] Node.js version: 
node -v

REM Install root dependencies
echo [INFO] Installing root dependencies...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install root dependencies
    exit /b 1
)

REM Build frontend
echo [INFO] Building frontend...
cd frontend
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install frontend dependencies
    exit /b 1
)
call npm run build
if %errorlevel% neq 0 (
    echo [ERROR] Frontend build failed
    exit /b 1
)
echo [INFO] Frontend build completed successfully
cd ..

REM Build backend
echo [INFO] Building backend...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install backend dependencies
    exit /b 1
)
echo [INFO] Backend dependencies installed
cd ..

echo [INFO] ✅ Build process completed successfully!
echo [INFO] Frontend build output: frontend/dist/
echo [INFO] Backend ready to run: cd backend ^&^& npm start

REM Optional: Create production package
if "%1"=="--package" (
    echo [INFO] Creating production package...
    if not exist dist mkdir dist
    xcopy frontend\dist dist\frontend /E /I /Y >nul
    xcopy backend dist\backend /E /I /Y >nul
    xcopy docker dist\docker /E /I /Y >nul
    copy package.json dist\ >nul
    copy .gitignore dist\ >nul
    echo [INFO] Production package created in dist/ folder
)

echo.
echo 🎉 Build completed successfully!
pause
