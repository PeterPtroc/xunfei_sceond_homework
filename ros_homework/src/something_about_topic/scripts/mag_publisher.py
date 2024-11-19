#!/usr/bin/env python3

import rospy
import random
from something_about_topic.msg import mag
from geometry_msgs.msg import Vector3
import time

def mag_publisher():
    rospy.init_node('mag_publisher', anonymous=True)
    mag_pub = rospy.Publisher('/driver/mag', mag, queue_size=10)
    rate = rospy.Rate(1)  # 1 Hz

    random.seed(time.time())

    while not rospy.is_shutdown():
        mag_msg = mag()
        mag_msg.header.stamp = rospy.Time.now()
        mag_msg.header.frame_id = "mag_frame"

        mag_msg.magnetic_field = Vector3(
            x=random.random(),
            y=random.random(),
            z=random.random()
        )

        mag_msg.magnetic_field_covariance = [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]

        mag_pub.publish(mag_msg)
        rospy.loginfo("publish mag data[magnetic_field: (%f, %f, %f)]", 
                      mag_msg.magnetic_field.x, mag_msg.magnetic_field.y, mag_msg.magnetic_field.z)

        rate.sleep()

if __name__ == '__main__':
    try:
        mag_publisher()
    except rospy.ROSInterruptException:
        pass