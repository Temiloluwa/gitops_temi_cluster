# Use Python 3.10 Alpine as the base image
FROM python:3.10-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the service code into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the RPC port
EXPOSE 8083

# Command to run the Nameko service
CMD ["nameko", "run", "--config", "./config.yaml", "inspire_service:InspireService"]
