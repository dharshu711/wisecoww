# Use a specific base image version for consistency.
FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends cowsay fortune netcat && \
    rm -rf /var/lib/apt/lists/*

# Copy the Wisecow script into the container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port the service listens to
EXPOSE 4499

# Run the script as the entry point
ENTRYPOINT ["/usr/local/bin/wisecow.sh"]


