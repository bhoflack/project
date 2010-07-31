(defpackage :pfus 
  (:use :asdf :cl))

(in-package :pfus)

(defsystem pfus
  :name "pfus"
  :author "Brecht Hoflack <brecht.hoflack@gmail.com>"
  :version "1.0"
  :maintainer "Brecht Hoflack <brecht.hoflack@gmail.com>"
  :licence "BSD"
  :description "Project Follow Up System"
  :long-description ""
  :components
  ((:file "packages")
   (:file "db" :depends-on ("packages"))
   (:file "pfus" :depends-on ("packages" "db"))))