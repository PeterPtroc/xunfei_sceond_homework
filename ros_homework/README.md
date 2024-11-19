配置了launch文件

使用roslaunch something_about_topic cpp.launch来启动cpp版本

使用roslaunch something_about_topic py.launch来启动python版本

```bash
catkin_make

source devel/setup.bash

roslaunch something_about_topic cpp.launch
roslaunch something_about_topic py.launch
```