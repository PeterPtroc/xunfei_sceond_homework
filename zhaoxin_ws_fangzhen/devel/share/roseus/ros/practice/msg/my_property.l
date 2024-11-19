;; Auto-generated. Do not edit!


(when (boundp 'practice::my_property)
  (if (not (find-package "PRACTICE"))
    (make-package "PRACTICE"))
  (shadow 'my_property (find-package "PRACTICE")))
(unless (find-package "PRACTICE::MY_PROPERTY")
  (make-package "PRACTICE::MY_PROPERTY"))

(in-package "ROS")
;;//! \htmlinclude my_property.msg.html


(defclass practice::my_property
  :super ros::object
  :slots (_name _Class ))

(defmethod practice::my_property
  (:init
   (&key
    ((:name __name) "")
    ((:Class __Class) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _Class (round __Class))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:Class
   (&optional __Class)
   (if __Class (setq _Class __Class)) _Class)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint16 _Class
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint16 _Class
       (write-word _Class s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _Class
     (setq _Class (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get practice::my_property :md5sum-) "7b612338cd379b8b3ac06022ef0b6cbc")
(setf (get practice::my_property :datatype-) "practice/my_property")
(setf (get practice::my_property :definition-)
      "#根据python文件中的内容补全该文件

string name
uint16 Class
")



(provide :practice/my_property "7b612338cd379b8b3ac06022ef0b6cbc")


