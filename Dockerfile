FROM unclecode/crawl4ai:basic

# Expose the port
EXPOSE 11235

# Set environment variables
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235

# Make sure we have the correct permissions and paths
USER root
RUN mkdir -p /app/logs && \
    chmod -R 755 /app

# Set the working directory
WORKDIR /app

# The base image should have an entrypoint script, but let's make sure it's executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Use the entrypoint script
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]