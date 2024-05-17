# Nginx Reverse Proxy with Flask Application

This project demonstrates the setup of a reverse proxy using Nginx to forward traffic to a Flask application running within Docker containers. The Flask application serves as the backend service, while Nginx acts as the front-facing server.

## Overview

The project comprises two Docker containers and one Nginx config file:

1. **Flask Container**: A Docker container running a simple Flask application.
2. **Nginx Container**: A Docker container running Nginx acting as a reverse proxy.
3. **Nginx Config**: A nginx.conf file to config nginx web server for handling incoming requests and proxy them to the Flask application.

## Prerequisites

Ensure you have the following prerequisites installed on your machine:

- Docker Engine: Installation instructions can be found [here](https://docs.docker.com/get-docker/).

## Setup Instructions

Follow these steps to set up and run the project:

1. **Clone the Repository**: Clone this repository to your local machine.

    ```bash
    <span style="color: black;">git clone <repository-url></span>
    ```

2. **Build Docker Images**: Navigate to the project directory and build the Docker images for the Flask application and Nginx.

    ```bash
    cd <project-directory>
    docker build -t flask-app -f flask.Dockerfile .
    docker build -t nginx-reverse-proxy -f nginx.Dockerfile .
    ```

3. **Run Docker Containers**: Start the Docker containers for the Flask application and Nginx.

    ```bash
    # Run Flask container
    docker run -d -p 8081:5000 --name flask_app flask-app

    # Run Nginx container
    docker run -d -p 8080:8080 --name nginx --link flask_app:flask_app nginx-reverse-proxy
    ```

4. **Access the Application**: Access the Flask application through Nginx by visiting `http://localhost:8080` or `http://<host-ip>:8080`.

## Customization

- **Changing Ports**: Modify the port mappings in the Docker run commands and Nginx configuration file (`nginx.conf`) to use different ports.
  
- **Customizing Flask Application**: Customize the Flask application (`app.py`) to add more routes and functionality as required.

- **Customizing Nginx Configuration**: Edit the `nginx.conf` file to customize the Nginx configuration. Rebuild the Nginx Docker image after making changes.

## Troubleshooting

- Ensure Docker is properly installed and running on your machine. Check Docker logs for any error messages.
  
- Verify that the Flask application is running and accessible before starting the Nginx container.

