@echo off
REM Production Deployment Script for FreeCodeVeda (Windows)
REM This script helps prepare and deploy the application to Netlify and Render

setlocal enabledelayedexpansion

echo 🚀 Starting production deployment for FreeCodeVeda...

REM Check if we're in the right directory
if not exist "package.json" (
    echo [ERROR] Please run this script from the project root directory
    exit /b 1
)

if not exist "frontend" (
    echo [ERROR] Frontend directory not found
    exit /b 1
)

if not exist "backend" (
    echo [ERROR] Backend directory not found
    exit /b 1
)

REM Check Node.js version
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo [INFO] Node.js version: %NODE_VERSION%

REM Install dependencies
echo [INFO] Installing dependencies...
call npm run install:all
if errorlevel 1 (
    echo [ERROR] Failed to install dependencies
    exit /b 1
)

REM Build frontend
echo [INFO] Building frontend...
cd frontend
call npm run build
cd ..
if errorlevel 1 (
    echo [ERROR] Frontend build failed
    exit /b 1
)

if not exist "frontend\dist" (
    echo [ERROR] Frontend build output not found
    exit /b 1
)

echo [SUCCESS] Frontend built successfully!

REM Build backend
echo [INFO] Building backend...
cd backend
call npm run build
cd ..
if errorlevel 1 (
    echo [ERROR] Backend build failed
    exit /b 1
)

echo [SUCCESS] Backend built successfully!

REM Check environment files
echo [INFO] Checking environment configuration...

if not exist "frontend\env.production.template" (
    echo [ERROR] Frontend production environment template not found
    exit /b 1
)

if not exist "backend\env.production.template" (
    echo [ERROR] Backend production environment template not found
    exit /b 1
)

REM Create production environment files if they don't exist
if not exist "frontend\.env.production" (
    echo [WARNING] Creating frontend .env.production from template...
    copy "frontend\env.production.template" "frontend\.env.production"
    echo [WARNING] Please update frontend\.env.production with your actual values
)

if not exist "backend\.env.production" (
    echo [WARNING] Creating backend .env.production from template...
    copy "backend\env.production.template" "backend\.env.production"
    echo [WARNING] Please update backend\.env.production with your actual values
)

REM Check for required environment variables
echo [INFO] Checking environment variables...

REM Check frontend environment
findstr "your-backend-url.onrender.com" "frontend\.env.production" >nul 2>&1
if not errorlevel 1 (
    echo [WARNING] Frontend API URL still contains placeholder value
    echo [WARNING] Please update frontend\.env.production with your actual Render backend URL
)

REM Check backend environment
findstr "your_mongodb_atlas_connection_string" "backend\.env.production" >nul 2>&1
if not errorlevel 1 (
    echo [WARNING] Backend MongoDB URI still contains placeholder value
    echo [WARNING] Please update backend\.env.production with your actual MongoDB Atlas connection string
)

findstr "your_secure_jwt_secret_key_here" "backend\.env.production" >nul 2>&1
if not errorlevel 1 (
    echo [WARNING] Backend JWT secret still contains placeholder value
    echo [WARNING] Please update backend\.env.production with a secure JWT secret
)

findstr "your-netlify-site.netlify.app" "backend\.env.production" >nul 2>&1
if not errorlevel 1 (
    echo [WARNING] Backend CORS origin still contains placeholder value
    echo [WARNING] Please update backend\.env.production with your actual Netlify frontend URL
)

REM Generate deployment summary
echo [INFO] Generating deployment summary...

(
echo # FreeCodeVeda Deployment Summary
echo.
echo ## Frontend ^(Netlify^)
echo - **Build Command**: `npm run build`
echo - **Publish Directory**: `frontend\dist`
echo - **Base Directory**: `frontend`
echo - **Environment File**: `frontend\.env.production`
echo.
echo ## Backend ^(Render^)
echo - **Build Command**: `npm install`
echo - **Start Command**: `npm start`
echo - **Root Directory**: `backend`
echo - **Environment File**: `backend\.env.production`
echo - **Port**: 10000
echo.
echo ## Next Steps
echo.
echo ### 1. Deploy Frontend to Netlify
echo 1. Go to [netlify.com]^(https://netlify.com^)
echo 2. Create new site from Git
echo 3. Select your repository
echo 4. Set base directory to `frontend`
echo 5. Set build command to `npm run build`
echo 6. Set publish directory to `dist`
echo 7. Add environment variables from `frontend\.env.production`
echo.
echo ### 2. Deploy Backend to Render
echo 1. Go to [render.com]^(https://render.com^)
echo 2. Create new Web Service
echo 3. Connect your GitHub repository
echo 4. Set root directory to `backend`
echo 5. Set build command to `npm install`
echo 6. Set start command to `npm start`
echo 7. Add environment variables from `backend\.env.production`
echo.
echo ### 3. Update URLs
echo 1. After backend deployment, get the Render URL
echo 2. Update frontend `VITE_API_URL` in Netlify
echo 3. Update backend `CORS_ORIGIN` in Render
echo 4. Redeploy both services
echo.
echo ## Environment Variables Required
echo.
echo ### Frontend ^(.env.production^)
echo - `VITE_API_URL`: Your Render backend URL
echo - `VITE_APP_NAME`: FreeCodeVeda
echo.
echo ### Backend ^(.env.production^)
echo - `NODE_ENV`: production
echo - `PORT`: 10000
echo - `MONGODB_URI`: MongoDB Atlas connection string
echo - `JWT_SECRET`: Secure JWT secret
echo - `CORS_ORIGIN`: Your Netlify frontend URL
echo.
echo ## Important Notes
echo - Both .env.production files are in .gitignore
echo - Update environment variables in the respective platform dashboards
echo - Test the deployment with the health check endpoint: `/api/health`
echo - Monitor logs for any errors during deployment
echo.
echo Generated on: %date% %time%
) > DEPLOYMENT_SUMMARY.md

echo [SUCCESS] Deployment summary created: DEPLOYMENT_SUMMARY.md

REM Final instructions
echo.
echo 🎯 Deployment preparation completed!
echo.
echo 📋 Next steps:
echo 1. Update environment variables in the .env.production files
echo 2. Deploy frontend to Netlify
echo 3. Deploy backend to Render
echo 4. Update URLs and redeploy
echo.
echo 📖 See DEPLOYMENT_SUMMARY.md for detailed instructions
echo 📖 See docs\DEPLOYMENT_GUIDE.md for comprehensive guide
echo.
echo 🔗 Useful links:
echo - Netlify: https://netlify.com
echo - Render: https://render.com
echo - MongoDB Atlas: https://mongodb.com/cloud/atlas
echo.
echo [SUCCESS] Happy deploying! 🚀

pause
