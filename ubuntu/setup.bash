#!/bin/bash
# -*- coding: utf-8 -*-

ditro=$(lsb_release -cs)
if [[ $distro == "ulyana" ]];then
    distro="focal"
elif [ -n $1 ];then
    distro="$1"
fi

sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $distro main" > ros2-latest.list
sudo cp ros2-latest.list > /etc/apt/sources.list.d
rm ros2-latest.list
sudo apt update
sudo apt install ros-foxy-desktop python3-colcon-common-extensions
