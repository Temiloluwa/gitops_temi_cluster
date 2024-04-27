# RPC Calls Demo with Nameko and FastAPI

This app demostrates Remote Procedure Calls (RPC) using Nameko and FastAPI. The application consists of two microservices: a FastAPI service for handling user input and providing encouragement messages, and a Nameko service for generating encouragement messages.

## Functionality

1. The application allows users to submit what they are grateful for via a form provided by the FastAPI service.
2.  Upon submission, the FastAPI service sends the gratitude message to the Nameko service using RPC. 
3. The Nameko service then generates a random encouragement message and sends it back to the FastAPI service.
4.  Finally, the FastAPI service displays the submitted gratitude message along with the randomly generated encouragement to the user.


## Prerequisites

- Docker
- Docker Compose
- Python
- Docker Swarm cluster (created with `docker swarm init`)

## Setup Instructions

1. Clone this repository:

```
git clone <repository_url>
cd microservices
```

2. Build and run RabbitMQ:

```
cd rabbitmq
./deploy_to_stack.sh
```

3. Build and deploy FastAPI service to Docker Swarm:

```
cd ../fastapi
./build_image.sh
./deploy_to_stack.sh
```

4. Build and deploy Nameko service to Docker Swarm:

```
cd ../inspire
./build_image.sh
./deploy_to_stack.sh
```

## Usage

- Access the FastAPI service at `http://localhost:8000` in your browser.
- Enter what you are grateful for in the form and submit.
- You'll receive a randomly generated encouragement message based on your input.

## Additional Notes

- The FastAPI service interacts with the Nameko service via RPC calls.
- RabbitMQ is used as the message broker for communication between services.
- HTML templates for the FastAPI service are located in the `fastapi/templates` directory.