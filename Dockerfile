# Use the official AnythingLLM image
FROM mintplexlabs/anythingllm:latest

# Set Railway-specific environment variables
ENV NODE_ENV=production
ENV ANYTHING_LLM_RUNTIME=railway
ENV DEPLOYMENT_VERSION=1.8.5

# Expose port for Railway
EXPOSE 3001

# Railway health check endpoint
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:3001/ || exit 1

# Use the existing entrypoint from the base image
ENTRYPOINT ["/bin/bash", "/usr/local/bin/docker-entrypoint.sh"]
