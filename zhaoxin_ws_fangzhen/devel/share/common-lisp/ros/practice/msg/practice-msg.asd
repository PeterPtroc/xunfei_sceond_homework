
(cl:in-package :asdf)

(defsystem "practice-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "my_property" :depends-on ("_package_my_property"))
    (:file "_package_my_property" :depends-on ("_package"))
  ))