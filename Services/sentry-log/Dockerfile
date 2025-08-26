FROM sentry:latest

# Install any additional dependencies
RUN apt-get update && apt-get install -y \
    # Add any packages you need (example: vim for debugging)
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copy custom configuration files (if you have any)
# COPY sentry.conf.py /etc/sentry/
# COPY config.yml /etc/sentry/

# Set working directory
WORKDIR /usr/src/sentry

# Expose the internal container port (Sentry runs on 9000 inside container)
EXPOSE 9000