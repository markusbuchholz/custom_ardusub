
# Build custom ArduSub (BlueROV2)

## Introduction

This repository offers the environment (in Docker) for building Ardusub. <br>
The intention for the repository is to provide all necessary tools and information to build custom [ArduSub](https://www.ardusub.com/) without installation on the host PC.<br>

**Note. Perform all steps in the following sequence as it guarantees a correct build.**

---
## Pre-Build

 ```bash

git clone https://github.com/markusbuchholz/custom_ardusub

cd custom_ardusub

git clone https://github.com/ardupilot/ardupilot.git

cd ardupilot

git submodule update --init --recursive

git fetch --tags

git checkout ArduSub-stable -b new-branch

git submodule update --init --recursive

```

 ## Build

 Note. Make scripts executable: ```chmod +x build.sh run.sh```

 ```bash

cd custom_ardusub/docker

sudo ./build.sh

```

 ## Run

 Notes:

 - Adjust to your own specific in ```run.sh``` : ```VOLUME_SOURCE="/home/markus/custom_ardusub/ardupilot"```. <br>
 - ```Waf``` is a global build system for ArduPilot repository.<br>
 - Note. sudo password in Docker container is : ```ardusub```.<br>
 - The firmware file will be created at ```/ardupilot/build/Pixhawk1/bin/```.<br>



 ```bash

cd custom_ardusub/docker

sudo ./run.sh

cd ardupilot

Tools/environment_install/install-prereqs-ubuntu.sh -y

. ~/.profile

sudo nano /etc/hosts

# Add the following line if it’s not already present:
# 127.0.1.1  ardusub

sudo chown -R devuser:devuser /home/devuser/ardupilot

# Print all available commands and configurations

./waf --help

# Configure board (Navigator is a Pixhawk 1) 

./waf configure --board Pixhawk1

# Build

./waf sub

```


## Useful links

 - [Custom Firmware Builder](https://custom.ardupilot.org/)
 - [how-to-control-thrusters-independently](https://discuss.bluerobotics.com/t/how-to-control-thrusters-independently/9870)
 - [custom configuration](https://www.ardusub.com/developers/developers.html#making-a-custom-configuration)
 - [Ardupilot source](https://github.com/ArduPilot/ardupilot)
 - [PWM motor configuration in BlueOS](https://github.com/bluerobotics/BlueOS/blob/master/core/frontend/src/components/vehiclesetup/PwmSetup.vue)
 - [My BlueRobotics architecture presentation](https://docs.google.com/presentation/d/1L9FzHzYUFvdV-qV7_xJEBZ75VjJyGAZlXEuWe-whuMk/edit#slide=id.g2de1e202d73_0_4)
