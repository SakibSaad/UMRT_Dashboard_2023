# Initial Dashboard

##
Topic: /latency <br>
Type: Publisher <br>
Message: String <br>
Format: <br>
    jetson_ping_result;RPi_ping_result <br>
    8.5 ms;7.9 ms <br>
    7.5 ms;down <br>
    down;down <br>
    timeout;timeout (ping command timed out) <br>

## Install RosBridge:
1. Install RosBridge server by running the following command:
    ```shell
    sudo apt install ros-<ROS_DISTRO>-rosbridge-server
    ```
2. Source your ROS distribution setup:
    ```shell
    source /opt/ros/<ROS_DISTRO>/setup.bash
    ```
3. Install script dependencies
    ```shell
    sudo apt install expect -y
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

## Run Teleop Twist Keyboard:

    ros2 run teleop_twist_keyboard teleop_twist_keyboard



## install dependencies
```bash
# speak_node
pip3 install pygame
```