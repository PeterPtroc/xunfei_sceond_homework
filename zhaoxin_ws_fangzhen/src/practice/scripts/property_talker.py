#!/usr/bin/env python3

import rospy
import time
from practice.msg import my_property

def property_talker():
    rospy.init_node('property_talker')
    pub = rospy.Publisher('property', my_property, queue_size=10)
    rate = rospy.Rate(1)  # 1 Hz
    py_start_time = rospy.Time.from_sec(time.time())

    while not rospy.is_shutdown():
        msg = my_property()
        msg.name = "Student"
        msg.Class = 2023
        py_time = rospy.Time.from_sec(time.time())
        pub.publish(msg)
        rospy.loginfo("Published: name = %s, class = %d, at %d", msg.name, msg.Class, py_time.secs - py_start_time.secs)
        rate.sleep()

if __name__ == '__main__':
    try:
        property_talker()
    except rospy.ROSInterruptException:
        pass