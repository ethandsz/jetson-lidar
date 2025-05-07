# Fast-LIO Jetson Deployment

Deployment of Fast-LIO on a Jetson device with Livox mid360. Set up submodules, configure Docker (host-machine only), and run the system.

## Submodules Installation

This repository uses submodules. Follow each submodule's `README.md` for installation and setup instructions.

To initialize and update all submodules:

```bash
git submodule update --init --recursive
```

## Docker Setup on Host Machine

1. Open the `run_docker.bash` script.
2. Modify the volume mount path to bind the container to the directory this repo is in.
3. Make sure ROS_LOCALHOST_ONLY env var is set to 0 to allow communication from the jetson. Also if you'd like setup a ROS_DOMAIN_ID to ensure no weird issues with other devices on the same network. 


Example:

```bash
-v /absolute/path/to/this/repo:/workspace
```

Replace `/absolute/path/to/this/repo` with the full path to the repository.

## Jetson Networking Configuration

Configure the Jetson network interface to communicate with the Livox LiDAR:

```bash
sudo ifconfig {network-adapter} 192.168.1.50 netmask 255.255.255.0 up
sudo ip route del 192.168.1.0/24 dev {network-adapter}
sudo ip route add {livox-ip} dev {network-adapter}
```

Replace `{network-adapter}` with the name of the network interface (e.g., `enP67ps0`), and `{livox-ip}` with the IP address of the Livox sensor.

## Run Fast-LIO on Jetson

Once networking is configured and submodules are installed and sourced, run:

```bash
ros2 launch fast_lio mapping.launch.py config_file:=mid360.yaml
ros2 launch livox_ros_driver2 msg_MID360_launch.py
```

## Visualize with RViz

On a second machine:

1. Launch RViz.
2. Load the RViz config file located in the rviz-configs directory of this repository to view the output.
