#include <ros/ros.h>
#include <practice/my_property.h>

int main(int argc, char **argv) {
    ros::init(argc, argv, "property_talker");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<practice::my_property>("property", 10);
    ros::Rate rate(1);  // 1 Hz

    ros::Time start_time = ros::Time::now();

    while (ros::ok()) {
        practice::my_property msg;
        msg.name = "Student";
        msg.Class = 2023;
        ros::Time current_time = ros::Time::now();
        pub.publish(msg);
        ROS_INFO("Published: name = %s, class = %d, at %d", msg.name.c_str(), msg.Class, (current_time - start_time).toSec());
        rate.sleep();
    }

    return 0;
}