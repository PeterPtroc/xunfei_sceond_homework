#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo("Received message: %s", data.data)

def listener():
    rospy.init_node('listener')
    rospy.Subscriber("hello_ros_topic", String, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()