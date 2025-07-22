@echo off
for /f "tokens=14" %%i in ('ipconfig ^| findstr /R "IPv4.*"') do set IP=%%i
echo MQTT broker will be accessible on: %IP%:1883
docker run -it --rm --name mqtt-broker ^
  -p 1883:1883 ^
  -v %cd%\mosquitto.conf:/mosquitto/config/mosquitto.conf ^
  eclipse-mosquitto
