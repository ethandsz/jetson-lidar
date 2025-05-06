xhost local:root


XAUTH=/tmp/.docker.xauth

docker run -it \
    --name=ros-humble-jetson \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/home/ethan/Documents/Github/jetson-lidar/:/home/ethan/Documents/Github/jetson-lidar/" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    osrf/ros:humble-desktop-full \
    bash

echo "Done."
