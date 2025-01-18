FROM unclecode/crawl4ai:basic

# Expose the port
EXPOSE 11235

# Set any environment variables if needed
ENV MAX_CONCURRENT_TASKS=5
