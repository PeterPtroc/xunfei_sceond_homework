#include <ros/ros.h>
#include <practice/my_property.h>

void callback(const practice::my_property::ConstPtr& msg) {
    ROS_INFO("Received message: %s", msg->name.c_str());
    ROS_INFO("Received message: %d", msg->Class);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "property_listener");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("property", 10, callback);
    ros::spin();
    return 0;
}