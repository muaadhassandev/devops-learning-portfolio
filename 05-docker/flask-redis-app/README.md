# Flask + Redis Multi-Container Application

## Overview

This project demonstrates how to build and run a multi-container application using Docker and Docker Compose.

The application uses Flask to serve a web interface and Redis to store and increment a visit counter. Docker Compose manages both services and enables communication between the containers.

## Architecture

The application consists of two services:

- **Flask (Web):** Handles HTTP requests and provides the welcome page and visit counter.
- **Redis (Database):** Stores the visit count in memory and increments it whenever the counter endpoint is accessed.

Docker Compose creates a shared network so the Flask container can communicate with Redis using its service name.

## Technologies Used

- Python
- Flask
- Redis
- Docker
- Docker Compose

## Application Endpoints

| Endpoint | Description |
|---|---|
| `/` | Displays the welcome message |
| `/count` | Displays the number of visits and increments the counter |

The application is accessible locally on port `5001`.

## Project Structure

```text
flask-redis-app/
├── app.py
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── README.md
└── screenshots/
    ├── home-page.png
    └── visit-counter.png
```

## How to Run

### 1. Clone the repository

```bash
git clone <your-repository-url>
cd flask-redis-app
```

### 2. Build and start the containers

```bash
docker compose up --build -d
```

### 3. Check the running services

```bash
docker compose ps
```

### 4. Access the application

- Home page: http://localhost:5001/
- Visit counter: http://localhost:5001/count

Refresh the visit counter page to observe the value increasing.

### 5. Stop the application

```bash
docker compose down
```

## Key Concepts Demonstrated

- Building a custom Docker image for a Python application.
- Running multiple containers using Docker Compose.
- Connecting application and database containers through Docker networking.
- Mapping container ports to the local machine.
- Using Redis as an in-memory key-value store.
- Using Docker Compose commands to build, run, inspect and stop services.

## Challenges and Troubleshooting

One issue encountered during development was a mismatch between the Flask application's listening port and the Docker Compose port mapping. Aligning the configuration resolved the connectivity issue.

Another issue was a `404 Not Found` response when accessing the visit counter. Checking the Flask routes and container logs helped identify the problem.

## Limitations and Future Improvements

- Add a Redis volume and persistence configuration to retain counter data across container recreation.
- Add a Redis health check and improve application startup handling.
- Use a production-ready WSGI server instead of Flask's development server.
- Add automated tests for both endpoints.
- Add a `.dockerignore` file to exclude unnecessary files from the build context.

## Outcome

Successfully deployed a Flask application and Redis database as separate Docker containers managed by Docker Compose. Verified that both endpoints worked and that the visit counter incremented through Redis.
