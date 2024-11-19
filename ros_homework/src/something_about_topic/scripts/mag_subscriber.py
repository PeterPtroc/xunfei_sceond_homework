#!/usr/bin/env python3

import rospy
from something_about_topic.msg import mag

def mag_callback(msg):
    rospy.loginfo("Received mag data[magnetic_field: (%f, %f, %f)]", 
                  msg.magnetic_field.x, msg.magnetic_field.y, msg.magnetic_field.z)

def mag_subscriber():
    rospy.init_node('mag_subscriber', anonymous=True)
    rospy.Subscriber('/driver/mag', mag, mag_callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        mag_subscriber()
    except rospy.ROSInterruptException:
        pass