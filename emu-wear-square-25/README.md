Docker image to raise an Nexus 5 emulator as service

# Configuration

See `start.sh` for supported ENVVARs.

# Drone-ci as example

Enable verbose mode and set memory to 256M

```yaml
service:
  nexus5:
    image: ronmi/docker-android:emu-25
	environment:
	  - AEMU_VERBOSE=1
	  - AEMU_MEMORY=256
```
