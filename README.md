# VueRustic
To run this project, you need to have [Rust](https://www.rust-lang.org/tools/install) and [Node.js](https://nodejs.org/en/download/) installed.\
To run environment, you need to have [Podman](https://podman.io/getting-started/installation) installed.

## Development environment
```shell
# Create a network for the containers
podman network create dev_network
# Make sure the script is executable
chmod +x ./.nginx/wait-for

# Start the containers
podman-compose -f podman-compose.dev.yml up
# Stop the containers
podman-compose -f podman-compose.dev.yml down --volumes
```
## Production environment
```shell
# Create a network for the containers
podman network create prod_network
# Make sure the script is executable
chmod +x ./.nginx/wait-for

# Start the containers
podman-compose -f podman-compose.prod.yml up client
# Stop the containers
podman-compose -f podman-compose.prod.yml down --volumes
```
Then, start the production Nginx server:
```shell
podman-compose -f podman-compose.prod.yml up nginx
```