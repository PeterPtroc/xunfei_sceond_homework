#!/usr/bin/env python3

import rospy
from practice.msg import my_property

def callback(data):
    rospy.loginfo("Received message: %s", data.name)
    rospy.loginfo("Received message: %s", data.Class)

###补全回调函数###

def property_listener():
    rospy.init_node('property_listener')
    rospy.Subscriber("property", my_property, callback)
    rospy.spin()

if __name__ == '__main__':
    property_listener()