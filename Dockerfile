FROM --platform=linux/amd64 unclecode/crawl4ai:basic

# Expose the port
EXPOSE 11235

# Set environment variables
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235