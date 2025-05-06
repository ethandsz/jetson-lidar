xhost local:root


XAUTH=/tmp/.docker.xauth

docker run -it \
    --name=ros-humble-jetson \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/absolute/path/to/this/repo:/workspace" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    osrf/ros:humble-desktop-full \
    bash

echo "Done."
