#!/bin/bash
# -*- coding: utf-8 -*-

mkdir -p ~/ros/foxy/src
cd ~/ros/foxy/
if [ ! -e "ros2.repos" ];then
    wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
fi
vcs import src < ros2.repos
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro foxy -y --skip-keys "console_bridge fastcdr fastrtps rti-connext-dds-5.3.1 urdfdom_headers"
cd ~/ros/foxy
colcon build --symlink-install