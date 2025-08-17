#!/bin/bash

# Build script for FreeCodeVeda
# This script builds both frontend and backend for production

set -e

echo "🚀 Starting build process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    print_error "Node.js version 18+ is required. Current version: $(node -v)"
    exit 1
fi

print_status "Node.js version: $(node -v)"

# Install root dependencies
print_status "Installing root dependencies..."
npm install

# Build frontend
print_status "Building frontend..."
cd frontend
npm install
npm run build
print_status "Frontend build completed successfully"
cd ..

# Build backend
print_status "Building backend..."
cd backend
npm install
print_status "Backend dependencies installed"
cd ..

print_status "✅ Build process completed successfully!"
print_status "Frontend build output: frontend/dist/"
print_status "Backend ready to run: cd backend && npm start"

# Optional: Create production package
if [ "$1" = "--package" ]; then
    print_status "Creating production package..."
    mkdir -p dist
    cp -r frontend/dist dist/frontend
    cp -r backend dist/backend
    cp -r docker dist/
    cp package.json dist/
    cp .gitignore dist/
    tar -czf freecodeveda-production.tar.gz dist/
    print_status "Production package created: freecodeveda-production.tar.gz"
fi
