#!/bin/bash


# kill python3 server
http_server_pid=$(ps aux |grep "python3 -m http.server" |awk '{for(i=1;i<=NF;i++) if ($i ~ /^[0-9]+$/) print $i}' |head -n1)
if [[ -n "$http_server_pid" ]]
then
  kill $http_server_pid
  echo "killed http server"
fi

# kill rosbridge launch
rosbridge_server_pid=$(ps aux | grep "/usr/bin/python3 /opt/ros/humble/bin/ros2 launch rosbridge_server rosbridge_websocket_launch.xml" |awk '{for(i=1;i<=NF;i++) if ($i ~ /^[0-9]+$/) print $i}' |head -n1)
if [[ -n "$rosbridge_server_pid" ]]
then
  kill $rosbridge_server_pid
  echo "killed rosbridge launch"
fi

# kill rosbridge websocket
rosbridge_websocket_pid=$(ps aux | grep "python3 /opt/ros/humble/lib/rosbridge_server/rosbridge_websocket" |awk '{for(i=1;i<=NF;i++) if ($i ~ /^[0-9]+$/) print $i}' |head -n1)
if [[ -n "$rosbridge_websocket_pid" ]]
then
  kill -9 $rosbridge_websocket_pid # -9 to kill the parent too | without this it dosen't work
  echo "killed rosbridge websocket"
fi
