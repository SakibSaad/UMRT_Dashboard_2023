# Data Visualization Using Chart

## Install RosBridge

1. Install RosBridge using the following command:
    ```
    sudo apt install ros-<ROS_DISTRO>-rosbridge-server
    ```

2. Source the ROS environment:
    ```
    source /opt/ros/<ROS_DISTRO>/setup.bash
    ```

## Launch RosBridge

1. Launch RosBridge using the following command:
    ```
    ros2 launch rosbridge_server rosbridge_websocket.launch \
    [The server will run at port 9090]
    ```

## Open Turtle Bot

1. Open the Turtle Bot by running the following command:
    ```
    ros2 run turtlesim turtlesim_node
    ```

## Open Teleop for Controlling Turtle

1. Open Teleop for controlling the turtle using the following command:
    ```
    ros2 run turtlesim turtle_teleop_key
