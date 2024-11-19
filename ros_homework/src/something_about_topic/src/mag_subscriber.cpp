#include <ros/ros.h>
#include <something_about_topic/mag.h>

void magCallback(const something_about_topic::mag::ConstPtr& msg) {
  ROS_INFO("Received mag data[magnetic_field: (%f, %f, %f)]", 
           msg->magnetic_field.x, msg->magnetic_field.y, msg->magnetic_field.z);
}


int main(int argc, char **argv) {
  ros::init(argc, argv, "mag_subscriber");
  ros::NodeHandle n;
  ros::Subscriber mag_sub = n.subscribe("/driver/mag", 10, magCallback);

  ros::spin();

  return 0;
}