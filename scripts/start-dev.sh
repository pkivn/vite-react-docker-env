#!/bin/bash

# -------------------------------------------------------
# start-dev.sh
# Script to start the React Vite development environment
# using Docker Compose
# -------------------------------------------------------

# Set the working directory to the project root
cd "$(dirname "$0")/.." || exit

# Print startup message
echo "Starting Vite React development environment..."

# Check if docker and docker-compose are installed
if ! command -v docker &> /dev/null; then
    echo "Error: docker is not installed or not in PATH"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Error: docker-compose is not installed or not in PATH"
    exit 1
fi

# Start the development environment
echo "Starting containers with docker-compose..."
docker-compose up --build

# If the user pressed Ctrl+C, make sure to stop containers gracefully
trap 'echo "Stopping containers..."; docker-compose down' INT TERM

# Exit with the status of the docker-compose command
exit $?
