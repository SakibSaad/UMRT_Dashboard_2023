# Initial Dashboard

## Install RosBridge:
1. Install RosBridge server by running the following command:
    ```shell
    sudo apt install ros-<ROS_DISTRO>-rosbridge-server
    ```
2. Source your ROS distribution setup:
    ```shell
    source /opt/ros/<ROS_DISTRO>/setup.bash
    ```

## Launch RosBridge:
1. Launch the RosBridge server with the following command:
    ```shell
    ros2 launch rosbridge_server rosbridge_websocket_launch.xml 
    ```
   This will start the server on port 9090.

## Launch /indicator topic:
2. Run the Python script to launch the `/indicator` topic. Run the following command:
    ```shell
    python3 ~/Downloads/send_to_indicator.py
    ```
   Note: For my case, I saved the `send_to_indicator.py` to the Downloads folder.
