#!/bin/bash

# Production Deployment Script for FreeCodeVeda
# This script helps prepare and deploy the application to Netlify and Render

set -e  # Exit on any error

echo "🚀 Starting production deployment for FreeCodeVeda..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -d "frontend" ] || [ ! -d "backend" ]; then
    print_error "Please run this script from the project root directory"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    print_error "Node.js 18 or higher is required. Current version: $(node --version)"
    exit 1
fi

print_success "Node.js version check passed: $(node --version)"

# Install dependencies
print_status "Installing dependencies..."
npm run install:all

# Build frontend
print_status "Building frontend..."
cd frontend
npm run build
cd ..

if [ ! -d "frontend/dist" ]; then
    print_error "Frontend build failed. Check the build output above."
    exit 1
fi

print_success "Frontend built successfully!"

# Build backend
print_status "Building backend..."
cd backend
npm run build
cd ..

print_success "Backend built successfully!"

# Check environment files
print_status "Checking environment configuration..."

if [ ! -f "frontend/env.production.template" ]; then
    print_error "Frontend production environment template not found"
    exit 1
fi

if [ ! -f "backend/env.production.template" ]; then
    print_error "Backend production environment template not found"
    exit 1
fi

# Create production environment files if they don't exist
if [ ! -f "frontend/.env.production" ]; then
    print_warning "Creating frontend .env.production from template..."
    cp frontend/env.production.template frontend/.env.production
    print_warning "Please update frontend/.env.production with your actual values"
fi

if [ ! -f "backend/.env.production" ]; then
    print_warning "Creating backend .env.production from template..."
    cp backend/env.production.template backend/.env.production
    print_warning "Please update backend/.env.production with your actual values"
fi

# Check for required environment variables
print_status "Checking environment variables..."

FRONTEND_ENV_FILE="frontend/.env.production"
BACKEND_ENV_FILE="backend/.env.production"

# Check frontend environment
if grep -q "your-backend-url.onrender.com" "$FRONTEND_ENV_FILE"; then
    print_warning "Frontend API URL still contains placeholder value"
    print_warning "Please update $FRONTEND_ENV_FILE with your actual Render backend URL"
fi

# Check backend environment
if grep -q "your_mongodb_atlas_connection_string" "$BACKEND_ENV_FILE"; then
    print_warning "Backend MongoDB URI still contains placeholder value"
    print_warning "Please update $BACKEND_ENV_FILE with your actual MongoDB Atlas connection string"
fi

if grep -q "your_secure_jwt_secret_key_here" "$BACKEND_ENV_FILE"; then
    print_warning "Backend JWT secret still contains placeholder value"
    print_warning "Please update $BACKEND_ENV_FILE with a secure JWT secret"
fi

if grep -q "your-netlify-site.netlify.app" "$BACKEND_ENV_FILE"; then
    print_warning "Backend CORS origin still contains placeholder value"
    print_warning "Please update $BACKEND_ENV_FILE with your actual Netlify frontend URL"
fi

# Generate deployment summary
print_status "Generating deployment summary..."

cat > DEPLOYMENT_SUMMARY.md << EOF
# FreeCodeVeda Deployment Summary

## Frontend (Netlify)
- **Build Command**: \`npm run build\`
- **Publish Directory**: \`frontend/dist\`
- **Base Directory**: \`frontend\`
- **Environment File**: \`frontend/.env.production\`

## Backend (Render)
- **Build Command**: \`npm install\`
- **Start Command**: \`npm start\`
- **Root Directory**: \`backend\`
- **Environment File**: \`backend/.env.production\`
- **Port**: 10000

## Next Steps

### 1. Deploy Frontend to Netlify
1. Go to [netlify.com](https://netlify.com)
2. Create new site from Git
3. Select your repository
4. Set base directory to \`frontend\`
5. Set build command to \`npm run build\`
6. Set publish directory to \`dist\`
7. Add environment variables from \`frontend/.env.production\`

### 2. Deploy Backend to Render
1. Go to [render.com](https://render.com)
2. Create new Web Service
3. Connect your GitHub repository
4. Set root directory to \`backend\`
5. Set build command to \`npm install\`
6. Set start command to \`npm start\`
7. Add environment variables from \`backend/.env.production\`

### 3. Update URLs
1. After backend deployment, get the Render URL
2. Update frontend \`VITE_API_URL\` in Netlify
3. Update backend \`CORS_ORIGIN\` in Render
4. Redeploy both services

## Environment Variables Required

### Frontend (.env.production)
- \`VITE_API_URL\`: Your Render backend URL
- \`VITE_APP_NAME\`: FreeCodeVeda

### Backend (.env.production)
- \`NODE_ENV\`: production
- \`PORT\`: 10000
- \`MONGODB_URI\`: MongoDB Atlas connection string
- \`JWT_SECRET\`: Secure JWT secret
- \`CORS_ORIGIN\`: Your Netlify frontend URL

## Important Notes
- Both .env.production files are in .gitignore
- Update environment variables in the respective platform dashboards
- Test the deployment with the health check endpoint: \`/api/health\`
- Monitor logs for any errors during deployment

Generated on: $(date)
EOF

print_success "Deployment summary created: DEPLOYMENT_SUMMARY.md"

# Final instructions
echo ""
echo "🎯 Deployment preparation completed!"
echo ""
echo "📋 Next steps:"
echo "1. Update environment variables in the .env.production files"
echo "2. Deploy frontend to Netlify"
echo "3. Deploy backend to Render"
echo "4. Update URLs and redeploy"
echo ""
echo "📖 See DEPLOYMENT_SUMMARY.md for detailed instructions"
echo "📖 See docs/DEPLOYMENT_GUIDE.md for comprehensive guide"
echo ""
echo "🔗 Useful links:"
echo "- Netlify: https://netlify.com"
echo "- Render: https://render.com"
echo "- MongoDB Atlas: https://mongodb.com/cloud/atlas"
echo ""
print_success "Happy deploying! 🚀"
