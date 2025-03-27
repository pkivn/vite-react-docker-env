#!/bin/bash

# -------------------------------------------------------
# install-in-project.sh
# Script to install Docker configuration into an existing
# Vite React project
# -------------------------------------------------------

# Function to display usage information
usage() {
  echo "Usage: $0 <target-project-path>"
  echo
  echo "This script installs Docker configuration files into a target Vite React project."
  echo "It copies the Dockerfile, docker-compose.yml, and other necessary files to set up"
  echo "a containerized development environment for the target project."
  echo
  exit 1
}

# Check if a target path was provided
if [ -z "$1" ]; then
  echo "Error: Target project path is required."
  usage
fi

# Get the full path of the target project
TARGET_PROJECT=$(realpath "$1")

# Get the directory of this script
SCRIPT_DIR=$(dirname "$(realpath "$0")")
ROOT_DIR=$(dirname "$SCRIPT_DIR")

# Check if the target directory exists
if [ ! -d "$TARGET_PROJECT" ]; then
  echo "Error: Target directory '$TARGET_PROJECT' does not exist."
  exit 1
fi

# Check if the target directory is a valid project (has a package.json file)
if [ ! -f "$TARGET_PROJECT/package.json" ]; then
  echo "Error: Target directory '$TARGET_PROJECT' does not appear to be a valid project (no package.json found)."
  exit 1
fi

# Create docker directory in the target project
echo "Creating docker directory in target project..."
mkdir -p "$TARGET_PROJECT/docker"

# Copy Docker configuration files
echo "Copying Docker configuration files..."
cp "$ROOT_DIR/Dockerfile" "$TARGET_PROJECT/docker/"
cp "$ROOT_DIR/docker-compose.yml" "$TARGET_PROJECT/docker/"
cp "$ROOT_DIR/docker-entrypoint.sh" "$TARGET_PROJECT/docker/"

# Make the entrypoint script executable
chmod +x "$TARGET_PROJECT/docker/docker-entrypoint.sh"

# Copy template files
echo "Copying template files..."
cp "$ROOT_DIR/templates/.env.development.template" "$TARGET_PROJECT/"
cp "$ROOT_DIR/templates/.gitignore.docker.template" "$TARGET_PROJECT/"

# Generate .env.development file
echo "Generating .env.development file from template..."
if [ -f "$TARGET_PROJECT/.env.development" ]; then
  echo "Warning: .env.development already exists. Creating .env.development.new instead."
  cp "$TARGET_PROJECT/.env.development.template" "$TARGET_PROJECT/.env.development.new"
else
  cp "$TARGET_PROJECT/.env.development.template" "$TARGET_PROJECT/.env.development"
fi

# Append Docker-specific entries to .gitignore if it exists
if [ -f "$TARGET_PROJECT/.gitignore" ]; then
  echo "Updating .gitignore with Docker-specific entries..."
  echo "" >> "$TARGET_PROJECT/.gitignore"
  echo "# Docker-specific files" >> "$TARGET_PROJECT/.gitignore"
  cat "$TARGET_PROJECT/.gitignore.docker.template" >> "$TARGET_PROJECT/.gitignore"
else
  echo "Creating .gitignore with Docker-specific entries..."
  cp "$TARGET_PROJECT/.gitignore.docker.template" "$TARGET_PROJECT/.gitignore"
fi

echo "✅ Installation complete!"
echo "Docker configuration has been installed in: $TARGET_PROJECT/docker/"
echo
echo "To start the development environment, run:"
echo "cd $TARGET_PROJECT && docker-compose -f docker/docker-compose.yml up"
echo
echo "You may need to modify .env.development to suit your project's needs."
