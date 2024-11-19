
(cl:in-package :asdf)

(defsystem "something_about_topic-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mag" :depends-on ("_package_mag"))
    (:file "_package_mag" :depends-on ("_package"))
  ))