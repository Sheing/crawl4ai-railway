FROM --platform=linux/arm64/v8 unclecode/crawl4ai:basic-arm64

ENV PYTHONUNBUFFERED=1
ENV MAX_CONCURRENT_TASKS=5
ENV PORT=11235

EXPOSE 11235

CMD ["uvicorn", "crawl4ai.server:app", "--host", "0.0.0.0", "--port", "11235"]