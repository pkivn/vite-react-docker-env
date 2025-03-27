#!/bin/sh
set -e

# Check if NODE_ENV is set
if [ -z "$NODE_ENV" ]; then
  echo "WARNING: NODE_ENV is not set. Defaulting to 'development'"
  export NODE_ENV=development
fi

# Log the environment
echo "Starting Vite React application in $NODE_ENV mode"

# Check if the package.json exists
if [ ! -f "package.json" ]; then
  echo "ERROR: package.json not found. Please make sure the application files are correctly mounted."
  exit 1
fi

# Check if dependencies are installed
if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install
fi

# Execute the command passed to docker
exec "$@"
