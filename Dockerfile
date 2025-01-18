FROM --platform=linux/arm64/v8 unclecode/crawl4ai:basic-arm64

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install uvicorn
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir uvicorn[standard]

# Environment variables
ENV PYTHONUNBUFFERED=1
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235

# Expose the port
EXPOSE 11235

# Start the server
CMD ["python3", "-m", "uvicorn", "crawl4ai.server:app", "--host", "0.0.0.0", "--port", "11235"]