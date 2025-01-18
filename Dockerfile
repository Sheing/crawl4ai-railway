FROM --platform=linux/arm64/v8 python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install crawl4ai and its dependencies
RUN pip3 install --no-cache-dir \
    crawl4ai \
    'uvicorn[standard]>=0.12.0'

# Environment variables
ENV PYTHONUNBUFFERED=1
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235
ENV PYTHONPATH=/usr/local/lib/python3.9/site-packages

# Expose the port
EXPOSE 11235

# Start the server
CMD ["python3", "-m", "uvicorn", "crawl4ai.server:app", "--host", "0.0.0.0", "--port", "11235"]