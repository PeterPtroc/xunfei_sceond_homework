# 分析 BAG 文件

## 目测

首先看文件名：建图
怀疑是激光扫描文件之类的

## 使用 rosbag info

```
path:        jiantu2.bag
version:     2.0
duration:    1:43s (103s)
start:       Sep 21 2024 06:52:48.60 (1726872768.60)
end:         Sep 21 2024 06:54:32.41 (1726872872.41)
size:        36.9 MB
messages:    91348
compression: none [48/48 chunks]
types:       nav_msgs/Odometry         [cd5e73d190d741a2f92e81eda573aca7]
             sensor_msgs/Imu           [6a62c6daae103f4ff57a132d6f95cec2]
             sensor_msgs/LaserScan     [90c7ef2dc6895d81024acba2ac42f369]
             sensor_msgs/MagneticField [2f3b0b43eed0c9501de0fa3ff89a45aa]
topics:      /driver/encoder    4758 msgs    : nav_msgs/Odometry
             /driver/eul       28635 msgs    : sensor_msgs/Imu
             /driver/imu       28469 msgs    : sensor_msgs/Imu
             /driver/mag       28469 msgs    : sensor_msgs/MagneticField
             /driver/scan       1017 msgs    : sensor_msgs/LaserScan
```

可以看出在这个 bag 中一共有 5 个话题，4 种数据类型：
IMU：明显来自惯性单元
LaserScan：明显来自雷达扫描
MagneticField：应该是磁力传感器
Odometry：查询得知是航迹推演（Odometry）

## 提取为 yaml 分析数据

### /driver/mag

```yaml
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Scanning ROS bag file "jiantu2.bag"
# for the following topics:
#    /driver/mag
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# =======================================
# topic:           /driver/mag
# msg_count:       1
# timestamp (sec): 1726872768.797210217
# - - -
header:
  seq: 224
  stamp:
    secs: 1726872768
    nsecs: 796722780
  frame_id: "imu_link"
magnetic_field:
  x: -0.2916666865348816
  y: -24.683334350585938
  z: -42.250003814697266
magnetic_field_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
```

seq 代表序列号，应该是从第 224 个包开始 record 的

stamp 是时间戳，sec 肯定就是 unix 时间 nsecs: 796722780 结合 msg 的 info：timestamp (sec): 1726872768.797210217 合理推测就是指小数点后面的部分

frame_id 查询得知 imu_link 是坐标系，frame_id 即为坐标系表示方式

magnetic_field 内容即为 x/y/z 轴上的磁场强度

magnetic_field_covariance 查到的只有定义方式，没查到具体的左右，只知道是表示不确定性的

### /driver/scan

```yaml
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Scanning ROS bag file "jiantu2.bag"
# for the following topics:
#    /driver/scan
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# =======================================
# topic:           /driver/scan
# msg_count:       1
# timestamp (sec): 1726872768.870787621
# - - -
header:
  seq: 8
  stamp:
    secs: 1726872768
    nsecs: 708397871
  frame_id: "laser_link"
angle_min: 0.0
angle_max: 6.2831854820251465
angle_increment: 0.006239508744329214
time_increment: 0.0
scan_time: 0.0
range_min: 0.0
range_max: 10.0
ranges: [……]
intensities: [……]
```

可以肯定"laser_link"为这个坐标系 id

angle_min 到 angle_max 正好是 2π，说明雷达转了一圈

angle_increment 表示离散的测量点之间的角度差

range_max 代表最大探测距离为 10m

ranges 存放着每个测量点的测量距离数据

intensities 代表强度，都是 0，估计就都是默认的满功率

尝试用 python 画了一下图，视频放在 src 里面了

不知道为什么 msg_count:593 的 scan_time 高达 2.0980255603790283

### /driver/eul

```yaml
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Scanning ROS bag file "jiantu2.bag"
# for the following topics:
#    /driver/eul
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# =======================================
# topic:           /driver/eul
# msg_count:       1
# timestamp (sec): 1726872768.599565029
# - - -
header:
  seq: 58
  stamp:
    secs: 1726872768
    nsecs: 407859582
  frame_id: "eul_link"
orientation:
  x: 0.03806536391522105
  y: 0.020444969875209995
  z: -0.29362123924457256
  w: 0.9549448147098789
orientation_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
angular_velocity:
  x: 0.0010073411220476404
  y: 0.0009819751014942676
  z: -0.000889391971036978
angular_velocity_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
linear_acceleration:
  x: -0.18556751385331155
  y: 0.8317366912961007
  z: 9.798441553115845
linear_acceleration_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
```

orientation：姿态，用四元数 xyzw 表示

angular_velocity：三个轴的角加速度

linear_acceleration：三个轴的线加速度

### /driver/imu

```yaml
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Scanning ROS bag file "jiantu2.bag"
# for the following topics:
#    /driver/imu
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# =======================================
# topic:           /driver/imu
# msg_count:       1
# timestamp (sec): 1726872768.797182083
# - - -
header:
  seq: 224
  stamp:
    secs: 1726872768
    nsecs: 796720301
  frame_id: "imu_link"
orientation:
  x: 0.042947206646203995
  y: -0.004563909024000168
  z: -0.2936190366744995
  w: 0.9549464583396912
orientation_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
angular_velocity:
  x: 0.0015580220936311782
  y: -0.0006092337065942958
  z: -0.00035603968422118573
angular_velocity_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
linear_acceleration:
  x: -0.1660102065652609
  y: 0.8320702999830246
  z: 9.855961561203003
linear_acceleration_covariance: [0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.1]
```

不太清楚 imu 和 eul 的区别，之前只知道 imu，感觉没啥区别

### /driver/encoder

```yaml
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Scanning ROS bag file "jiantu2.bag"
# for the following topics:
#    /driver/encoder
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# =======================================
# topic:           /driver/encoder
# msg_count:       1
# timestamp (sec): 1726872768.600995064
# - - -
header:
  seq: 8
  stamp:
    secs: 1726872768
    nsecs: 430500957
  frame_id: "odom"
child_frame_id: "base_footprint"
pose:
  pose:
    position:
      x: 0.0
      y: 0.0
      z: 0.0
    orientation:
      x: 0.0
      y: 0.0
      z: 0.0
      w: 0.0
  covariance: [……]
twist:
  twist:
    linear:
      x: 0.0
      y: 0.0
      z: 0.0
    angular:
      x: 0.0
      y: 0.0
      z: 0.0
  covariance: [……]
```

不知道为什么，发现只有 linear 的 x 数值在变，不知道为什么会这样

## 总结

总之，这就是一个开着激光雷达的机器人在动时录下来的数据
