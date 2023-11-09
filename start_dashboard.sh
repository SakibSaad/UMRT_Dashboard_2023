#!/bin/bash


ip_var=$(hostname -I)
ip_var="${ip_var%"${ip_var##*[![:space:]]}"}"

echo "





            Dashboard URL: $ip_var:8000





"

ros2 launch rosbridge_server rosbridge_websocket_launch.xml &
python3 -m http.server &

