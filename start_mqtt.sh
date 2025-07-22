#!/bin/bash

# Get current directory
DIR="$(pwd)"

# Run the Mosquitto broker in Docker
docker run -it --rm --name mqtt-broker \
  -p 1883:1883 \
  -v "$DIR/mosquitto.conf:/mosquitto/config/mosquitto.conf" \
  eclipse-mosquitto


echo "Your local IP:"
ipconfig getifaddr en0  # for Mac Wi-Fi
