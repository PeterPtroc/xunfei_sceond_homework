; Auto-generated. Do not edit!


(cl:in-package practice-msg)


;//! \htmlinclude my_property.msg.html

(cl:defclass <my_property> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (Class
    :reader Class
    :initarg :Class
    :type cl:fixnum
    :initform 0))
)

(cl:defclass my_property (<my_property>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_property>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_property)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name practice-msg:<my_property> is deprecated: use practice-msg:my_property instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <my_property>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practice-msg:name-val is deprecated.  Use practice-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'Class-val :lambda-list '(m))
(cl:defmethod Class-val ((m <my_property>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practice-msg:Class-val is deprecated.  Use practice-msg:Class instead.")
  (Class m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_property>) ostream)
  "Serializes a message object of type '<my_property>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Class)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Class)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_property>) istream)
  "Deserializes a message object of type '<my_property>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Class)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Class)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_property>)))
  "Returns string type for a message object of type '<my_property>"
  "practice/my_property")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_property)))
  "Returns string type for a message object of type 'my_property"
  "practice/my_property")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_property>)))
  "Returns md5sum for a message object of type '<my_property>"
  "7b612338cd379b8b3ac06022ef0b6cbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_property)))
  "Returns md5sum for a message object of type 'my_property"
  "7b612338cd379b8b3ac06022ef0b6cbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_property>)))
  "Returns full string definition for message of type '<my_property>"
  (cl:format cl:nil "#根据python文件中的内容补全该文件~%~%string name~%uint16 Class~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_property)))
  "Returns full string definition for message of type 'my_property"
  (cl:format cl:nil "#根据python文件中的内容补全该文件~%~%string name~%uint16 Class~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_property>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_property>))
  "Converts a ROS message object to a list"
  (cl:list 'my_property
    (cl:cons ':name (name msg))
    (cl:cons ':Class (Class msg))
))
