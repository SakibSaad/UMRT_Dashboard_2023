#!/usr/bin/expect -f

# Set variables
set user "neo"
set url "127.0.0.1"
set remoteFile "$user@$url:/home/neo/.GPS_Coordinate_Loader_GUI/gps_data.json"
set localDestination "./"
set password "meaw"

# Run scp and pass password
spawn scp $remoteFile $localDestination
expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
    eof
}

# Close the spawned process
wait

