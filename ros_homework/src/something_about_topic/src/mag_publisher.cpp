#include <ros/ros.h>
#include <something_about_topic/mag.h>
#include <geometry_msgs/Vector3.h>
#include <cstdlib>
#include <ctime>

int main(int argc, char **argv){
  ros::init(argc, argv, "mag_publisher");
  ros::NodeHandle n;
  ros::Publisher mag_pub = n.advertise<something_about_topic::mag>("/driver/mag", 10);
  ros::Rate loop_rate(1);

  std::srand(std::time(0));

  while (ros::ok()) {
    something_about_topic::mag mag_msg;
    mag_msg.header.stamp = ros::Time::now();
    mag_msg.header.frame_id = "mag_frame";

    mag_msg.magnetic_field.x = static_cast<double>(std::rand()) / RAND_MAX;
    mag_msg.magnetic_field.y = static_cast<double>(std::rand()) / RAND_MAX;
    mag_msg.magnetic_field.z = static_cast<double>(std::rand()) / RAND_MAX;

      double covariance[9] = {0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1};
      for (int i = 0; i < 9; ++i) {
        mag_msg.magnetic_field_covariance[i] = covariance[i];
      }

    mag_pub.publish(mag_msg);
    ROS_INFO("publish mag data[magnetic_field: (%f, %f, %f)]", 
             mag_msg.magnetic_field.x, mag_msg.magnetic_field.y, mag_msg.magnetic_field.z);

    loop_rate.sleep();
  }

  return 0;
}