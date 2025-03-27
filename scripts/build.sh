#!/bin/bash

# -------------------------------------------------------
# build.sh
# Script to build the React Vite application for production
# -------------------------------------------------------

# Set the working directory to the project root
cd "$(dirname "$0")/.." || exit

# Print startup message
echo "Building Vite React application for production..."

# Check if the package.json exists
if [ ! -f "package.json" ]; then
  echo "ERROR: package.json not found. Make sure you're running this script from the project root."
  exit 1
fi

# Run the build command using Docker to ensure consistent environment
echo "Building with Docker..."
docker-compose run --rm vite-react-app npm run build

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "✅ Build completed successfully!"
  echo "Production files are available in the 'dist' directory."
else
  echo "❌ Build failed. Please check the logs above for errors."
  exit 1
fi

echo "Done."
