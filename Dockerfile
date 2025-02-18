# Base image
FROM python:3.11

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install Gatsby and Yarn for frontend
RUN npm install -g gatsby-cli && npm install --global yarn

# Install AutoGen Studio
RUN pip install --no-cache-dir autogenstudio

# Expose the application port
EXPOSE 8081

# Set default directory for AutoGen Studio
ENV AUTOGENSTUDIO_APPDIR=/app/data

# Run AutoGen Studio
CMD ["autogenstudio", "ui", "--host", "0.0.0.0", "--port", "8081", "--appdir", "/app/data"]
