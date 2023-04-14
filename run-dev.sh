#!/bin/bash

set -e

# Variables
project_dir="$(pwd)/client"
container_dir="/app"
pod_name="vuerastic_dev"

# Create the pod
echo "Creating pod..."
podman pod create --name $pod_name -p 8080:80
echo "Pod created."

# Create a named volume for node_modules
echo "Creating named volume for node_modules..."
podman volume create my_node_modules
echo "Named volume created."

# Build the client and nginx images
echo "Building client image..."
podman build -t client "./client"
echo "Client image built."

echo "Building nginx image..."
podman build -t nginx "./.nginx"
echo "Nginx image built."

# Run the client container with the generated volume mounts
echo "Running client container..."
podman run -dt \
  --pod $pod_name \
  --name client-dev \
  -v $project_dir:$container_dir \
  -v my_node_modules:$container_dir/node_modules \
  client
echo "Client container running."

# Run the nginx container
echo "Running nginx container..."
podman run -dt --pod $pod_name --name nginx-dev -e APP_ENV=development nginx
echo "Nginx container running."

# Exit the script
exit 0
