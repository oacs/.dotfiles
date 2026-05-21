#!/bin/bash

# Development Environment Startup Script
# This script starts Docker engine, containers, PM2 processes, and AWS SSO login

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
WORKSPACE_PATH="${WORKSPACE_PATH:-$HOME/workspace}"
DOCKER_COMPOSE_PATH="$WORKSPACE_PATH/docker-compose"
ECOSYSTEM_PATH="$DOCKER_COMPOSE_PATH/ecosystem.config.js"

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

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if Docker is running
is_docker_running() {
    docker info >/dev/null 2>&1
}

# Function to check if PM2 is installed
is_pm2_installed() {
    command_exists pm2
}

# Function to check if AWS CLI is installed
is_aws_cli_installed() {
    command_exists aws
}

# Function to start Docker Desktop (macOS)
start_docker_desktop() {
    print_status "Starting Docker Desktop..."

    if ! is_docker_running; then
        # Try to start Docker Desktop
        open -a Docker

        # Wait for Docker to start (up to 60 seconds)
        print_status "Waiting for Docker to start..."
        local count=0
        while ! is_docker_running && [ $count -lt 60 ]; do
            sleep 2
            count=$((count + 2))
            echo -n "."
        done
        echo

        if is_docker_running; then
            print_success "Docker is now running"
        else
            print_error "Docker failed to start within 60 seconds"
            return 1
        fi
    else
        print_success "Docker is already running"
    fi
}

# Function to start Docker containers
start_docker_containers() {
    print_status "Starting Docker containers..."

    if [ ! -f "$DOCKER_COMPOSE_PATH/docker-compose.yml" ]; then
        print_error "docker-compose.yml not found at $DOCKER_COMPOSE_PATH"
        return 1
    fi

    cd "$DOCKER_COMPOSE_PATH"

    # Start containers in detached mode
    if docker compose up -d mongo elasticmq; then
        print_success "Docker containers started successfully"

        # Show running containers
        print_status "Running containers:"
        docker compose ps
    else
        print_error "Failed to start Docker containers"
        return 1
    fi
}

# Function to start PM2 processes
start_pm2_processes() {
    print_status "Starting PM2 processes..."

    if [ ! -f "$ECOSYSTEM_PATH" ]; then
        print_error "ecosystem.config.js not found at $ECOSYSTEM_PATH"
        return 1
    fi

    cd "$DOCKER_COMPOSE_PATH"

    # Start PM2 with ecosystem file
    if pm2 start ./ecosystem.config.js --only backend,account-service,rights-service,frontend; then
        print_success "PM2 processes started successfully"

        # Show PM2 status
        print_status "PM2 process status:"
        pm2 status
    else
        print_error "Failed to start PM2 processes"
        return 1
    fi
}

# Function to perform AWS SSO login
aws_sso_login() {
    print_status "Performing AWS SSO login..."

    # Check if AWS CLI is installed
    if ! is_aws_cli_installed; then
        print_warning "AWS CLI not found. Skipping AWS SSO login."
        return 0
    fi

    # Perform AWS SSO login
    if aws sso login; then
        print_success "AWS SSO login completed successfully"
    else
        print_warning "AWS SSO login failed or was cancelled"
    fi
}

# Function to show final status
show_final_status() {
    print_status "Development environment startup complete!"
    echo
    print_status "Services running:"
    echo "  - Docker containers: $(docker compose -f "$DOCKER_COMPOSE_PATH/docker-compose.yml" ps --services --filter status=running | wc -l | tr -d ' ') services"
    echo "  - PM2 processes: $(pm2 jlist | jq length 2>/dev/null || echo 'Unknown') processes"
    echo
    print_status "Useful commands:"
    echo "  - View Docker logs: docker compose -f $DOCKER_COMPOSE_PATH/docker-compose.yml logs -f"
    echo "  - View PM2 logs: pm2 logs"
    echo "  - Stop all: dev-stop"
}

# Function to stop PM2 processes
stop_pm2_processes() {
    print_status "Stopping PM2 processes..."

    if ! is_pm2_installed; then
        print_warning "PM2 not found. Skipping."
        return 0
    fi

    if pm2 stop backend account-service rights-service frontend; then
        print_success "PM2 processes stopped"
    else
        print_warning "Some PM2 processes may not have stopped cleanly"
    fi
}

# Function to stop Docker containers
stop_docker_containers() {
    print_status "Stopping Docker containers..."

    if [ ! -f "$DOCKER_COMPOSE_PATH/docker-compose.yml" ]; then
        print_warning "docker-compose.yml not found at $DOCKER_COMPOSE_PATH. Skipping."
        return 0
    fi

    cd "$DOCKER_COMPOSE_PATH"

    if docker compose stop mongo elasticmq; then
        print_success "Docker containers stopped"
    else
        print_warning "Failed to stop some Docker containers"
    fi
}

# Start flow
start_main() {
    print_status "Starting development environment..."
    echo

    # Check prerequisites
    print_status "Checking prerequisites..."

    if ! command_exists docker; then
        print_error "Docker is not installed"
        exit 1
    fi

    if ! is_pm2_installed; then
        print_error "PM2 is not installed. Install it with: npm install -g pm2"
        exit 1
    fi

    if [ ! -d "$WORKSPACE_PATH" ]; then
        print_error "Workspace directory not found: $WORKSPACE_PATH"
        exit 1
    fi

    print_success "Prerequisites check passed"
    echo

    # Start services in order
    start_docker_desktop
    echo

    start_docker_containers
    echo

    aws_sso_login
    echo

    start_pm2_processes
    echo

    show_final_status
}

# Stop flow
stop_main() {
    print_status "Stopping development environment..."
    echo

    stop_pm2_processes
    echo

    stop_docker_containers
    echo

    print_success "Development environment stopped"
}

# Main execution
main() {
    case "${1:-start}" in
        stop) stop_main ;;
        start|*) start_main ;;
    esac
}

# Run main function
main "$@"
