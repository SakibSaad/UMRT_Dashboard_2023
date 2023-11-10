#!/bin/bash


# kill python3 server
http_server_pid=$(ps aux |grep "python3 -m http.server" | head -n 1 |cut -d " " -f9)
if [[ "$http_server_pid" != " " ]]
then
  kill $http_server_pid
fi

# kill rosbridge launch
rosbridge_server_pid=$(ps aux | grep "/usr/bin/python3 /opt/ros/humble/bin/ros2 launch rosbridge_server rosbridge_websocket_launch.xml" | head -n1 | cut -d " " -f9)
if [[ "$rosbridge_server_pid" != " "  ]]
then
  kill $rosbridge_server_pid
fi

# kill rosbridge websocket
rosbridge_websocket_pid=$(ps aux | grep "python3 /opt/ros/humble/lib/rosbridge_server/rosbridge_websocket" |head -n1 |cut -d " " -f9)
if [[ "$rosbridge_websocket_pid" != " " ]]
then
  kill -9 $rosbridge_websocket_pid # -9 to kill the parent too | without this it dosen't work
fi
