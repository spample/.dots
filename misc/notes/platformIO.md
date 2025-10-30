# Build the project
pio run

# Upload firmware to the device
pio run -t upload

# Monitor serial output on a specific port
pio device monitor --port /dev/ttyUSB0

# Install a library
pio pkg install "Adafruit Unified Sensor"
