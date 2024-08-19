# Use a base image with Python
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install necessary system packages and tools to perform chaos tests
RUN apt-get update && \
    apt-get install -y \
    curl \
    stress \
    iproute2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY app/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app /app

# Expose the port the app runs on
EXPOSE 80

# Run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
