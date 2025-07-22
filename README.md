# MQTT Broker in Docker with Eclipse Mosquitto

This repository provides a simple, portable setup for running a [Mosquitto MQTT broker](https://mosquitto.org/) using Docker. It includes configuration, cross-platform launch scripts, and documentation for easy testing and development.

---

## Features

- Lightweight MQTT broker with Eclipse Mosquitto
- Dockerized setup — no need to install Mosquitto locally
- Custom `mosquitto.conf` for remote access
- Cross-platform launch scripts for Windows (`.bat`) and macOS/Linux (`.sh`)
- Works with MQTT clients like `mosquitto_pub`, `mosquitto_sub`, MQTT Explorer, and MyMQTT (iOS)

---

## Files Included
.

├── mosquitto.conf # Custom Mosquitto configuration (edit as needed)

├── start_mqtt.bat # Windows launch script

├── start_mqtt.sh # macOS/Linux launch script

└── README.md # Project documentation (this file)

---

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- A local network connection (for testing MQTT on multiple devices)
- Optional: `mosquitto-clients` installed for local CLI testing

---

## Usage
### Windows

1. Open a Command Prompt in this folder.
2. Run the broker:

   ```cmd
   start_mqtt.bat
### macOS / Linux
1. Open a Terminal in this folder.

2. Make the script executable (first time only):

    ```sh
    chmod +x start_mqtt.sh
3. Then run:

    ```sh
    ./start_mqtt.sh
---
## Testing the Broker
### Subscribe to all topics

    mosquitto_sub -h localhost -t "#" -v

### Publish a message

    mosquitto_pub -h localhost -t test/topic -m "Hello MQTT"

### From another device (e.g. phone)
1. Install an MQTT client like [MyMQTT](https://mymqtt.app/en) or [MQTT Explorer](https://mqtt-explorer.com/).

2. Connect using:

- Broker address: your computer’s Wi-Fi IP (e.g. 192.168.1.42)

- Port: 1883

- Client ID: any string

- Username/Password: leave blank

## Allowing Remote Access on Windows
To allow MQTT connections from other devices, add a firewall rule:

    New-NetFirewallRule -DisplayName "Allow MQTT 1883" -Direction Inbound -Protocol TCP -LocalPort 1883 -Action Allow

## mosquitto.conf Example

listener 1883
allow_anonymous true

This configuration allows anonymous access for testing. Do not use in production without authentication and encryption.

## Stopping the Broker
The broker runs in the foreground. Press Ctrl+C to stop it.
Since it runs with --rm, the container is automatically cleaned up.

## Sharing via GitHub
When someone clones this repository:

1. They install Docker Desktop

2. They run the appropriate script (start_mqtt.bat or start_mqtt.sh)

3. The broker becomes available on their local network via port 1883

## Security Notes
This setup is for local network testing only. If deploying more broadly:

- Set allow_anonymous false

- Configure authentication (password_file, acl_file)

- Use TLS (cafile, certfile, keyfile)

More info: https://mosquitto.org/documentation/authentication-methods/

📃 License
MIT — free to use, modify, and share.

