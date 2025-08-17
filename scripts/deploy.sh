#!/bin/bash

# Deployment script for FreeCodeVeda
# This script deploys the application using Docker

set -e

echo "🚀 Starting deployment process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

print_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Configuration
ENVIRONMENT=${1:-production}
DOCKER_COMPOSE_FILE="docker/docker-compose.yml"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    print_error "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

print_status "Docker version: $(docker --version)"
print_status "Docker Compose version: $(docker-compose --version)"

# Check if we're in the right directory
if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
    print_error "Docker Compose file not found. Please run this script from the project root."
    exit 1
fi

# Function to cleanup old containers
cleanup_old_containers() {
    print_step "Cleaning up old containers..."
    docker-compose -f $DOCKER_COMPOSE_FILE down --remove-orphans
    docker system prune -f
}

# Function to build and start services
deploy_services() {
    print_step "Building and starting services..."
    
    # Build images
    print_status "Building Docker images..."
    docker-compose -f $DOCKER_COMPOSE_FILE build --no-cache
    
    # Start services
    print_status "Starting services..."
    docker-compose -f $DOCKER_COMPOSE_FILE up -d
    
    # Wait for services to be ready
    print_status "Waiting for services to be ready..."
    sleep 30
    
    # Check service health
    print_step "Checking service health..."
    docker-compose -f $DOCKER_COMPOSE_FILE ps
}

# Function to check deployment status
check_deployment() {
    print_step "Checking deployment status..."
    
    # Check if services are running
    if docker-compose -f $DOCKER_COMPOSE_FILE ps | grep -q "Up"; then
        print_status "✅ Services are running successfully!"
        
        # Display service URLs
        echo ""
        print_status "Service URLs:"
        echo "  Frontend: http://localhost:3000"
        echo "  Backend API: http://localhost:5000"
        echo "  MongoDB: localhost:27017"
        echo "  Nginx: http://localhost:80"
        
    else
        print_error "❌ Some services failed to start. Check logs:"
        docker-compose -f $DOCKER_COMPOSE_FILE logs
        exit 1
    fi
}

# Function to show logs
show_logs() {
    print_step "Recent logs:"
    docker-compose -f $DOCKER_COMPOSE_FILE logs --tail=50
}

# Main deployment process
main() {
    print_status "Deploying to environment: $ENVIRONMENT"
    
    # Cleanup old containers
    cleanup_old_containers
    
    # Deploy services
    deploy_services
    
    # Check deployment
    check_deployment
    
    # Show logs
    show_logs
    
    print_status "🎉 Deployment completed successfully!"
    print_status "Your application is now running!"
}

# Handle command line arguments
case "$1" in
    "production"|"prod")
        main
        ;;
    "development"|"dev")
        ENVIRONMENT="development"
        DOCKER_COMPOSE_FILE="docker/docker-compose.dev.yml"
        main
        ;;
    "logs")
        show_logs
        ;;
    "stop")
        print_status "Stopping services..."
        docker-compose -f $DOCKER_COMPOSE_FILE down
        print_status "Services stopped"
        ;;
    "restart")
        print_status "Restarting services..."
        docker-compose -f $DOCKER_COMPOSE_FILE restart
        print_status "Services restarted"
        ;;
    *)
        echo "Usage: $0 {production|development|logs|stop|restart}"
        echo "  production  - Deploy to production environment"
        echo "  development - Deploy to development environment"
        echo "  logs        - Show service logs"
        echo "  stop        - Stop all services"
        echo "  restart     - Restart all services"
        exit 1
        ;;
esac
