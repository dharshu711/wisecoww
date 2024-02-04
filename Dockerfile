# Use a base image that includes bash, netcat, and apt package manager
FROM ubuntu:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install cowsay, fortune, and netcat
RUN apt-get update && apt-get install -y cowsay fortune netcat

# Copy the Wisecow script into the container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port the service listens on
EXPOSE 4499

# Run the script as the entry point
ENTRYPOINT ["/usr/local/bin/wisecow.sh"]

