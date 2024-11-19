#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def talker():
    rospy.init_node('talker')
    pub = rospy.Publisher('hello_ros_topic', String, queue_size=10)
    rate = rospy.Rate(10)  # 10 Hz

    while not rospy.is_shutdown():
        msg = String()
        msg.data = "Hello, ROS!"
        pub.publish(msg)
        rospy.loginfo("Sent message: %s", msg.data)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass