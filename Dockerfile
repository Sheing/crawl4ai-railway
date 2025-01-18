# Use the official ARM64 image as base
FROM unclecode/crawl4ai:basic-arm64

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235

# Expose the API port
EXPOSE 11235

# The base image already includes the necessary ENTRYPOINT/CMD