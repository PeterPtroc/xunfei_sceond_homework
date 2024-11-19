;; Auto-generated. Do not edit!


(when (boundp 'someting_about_topic::mag)
  (if (not (find-package "SOMETING_ABOUT_TOPIC"))
    (make-package "SOMETING_ABOUT_TOPIC"))
  (shadow 'mag (find-package "SOMETING_ABOUT_TOPIC")))
(unless (find-package "SOMETING_ABOUT_TOPIC::MAG")
  (make-package "SOMETING_ABOUT_TOPIC::MAG"))

(in-package "ROS")
;;//! \htmlinclude mag.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass someting_about_topic::mag
  :super ros::object
  :slots (_header _magnetic_field _magnetic_field_covariance ))

(defmethod someting_about_topic::mag
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:magnetic_field __magnetic_field) (instance geometry_msgs::Vector3 :init))
    ((:magnetic_field_covariance __magnetic_field_covariance) (make-array 9 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _magnetic_field __magnetic_field)
   (setq _magnetic_field_covariance __magnetic_field_covariance)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:magnetic_field
   (&rest __magnetic_field)
   (if (keywordp (car __magnetic_field))
       (send* _magnetic_field __magnetic_field)
     (progn
       (if __magnetic_field (setq _magnetic_field (car __magnetic_field)))
       _magnetic_field)))
  (:magnetic_field_covariance
   (&optional __magnetic_field_covariance)
   (if __magnetic_field_covariance (setq _magnetic_field_covariance __magnetic_field_covariance)) _magnetic_field_covariance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _magnetic_field
    (send _magnetic_field :serialization-length)
    ;; float64[9] _magnetic_field_covariance
    (* 8    9)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _magnetic_field
       (send _magnetic_field :serialize s)
     ;; float64[9] _magnetic_field_covariance
     (dotimes (i 9)
       (sys::poke (elt _magnetic_field_covariance i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _magnetic_field
     (send _magnetic_field :deserialize buf ptr-) (incf ptr- (send _magnetic_field :serialization-length))
   ;; float64[9] _magnetic_field_covariance
   (dotimes (i (length _magnetic_field_covariance))
     (setf (elt _magnetic_field_covariance i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get someting_about_topic::mag :md5sum-) "2f3b0b43eed0c9501de0fa3ff89a45aa")
(setf (get someting_about_topic::mag :datatype-) "someting_about_topic/mag")
(setf (get someting_about_topic::mag :definition-)
      "std_msgs/Header header
geometry_msgs/Vector3 magnetic_field
float64[9] magnetic_field_covariance
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :someting_about_topic/mag "2f3b0b43eed0c9501de0fa3ff89a45aa")


