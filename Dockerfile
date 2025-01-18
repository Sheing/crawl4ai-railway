# Use ARM64 Python base image
FROM --platform=linux/arm64 python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir \
    crawl4ai \
    uvicorn \
    fastapi

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235

# Expose the API port
EXPOSE 11235

# Create an entrypoint script
RUN echo '#!/bin/bash\nuvicorn crawl4ai.server:app --host 0.0.0.0 --port 11235' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]