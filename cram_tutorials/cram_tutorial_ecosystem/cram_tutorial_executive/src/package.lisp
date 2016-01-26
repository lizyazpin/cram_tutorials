(in-package :cl-user)

(desig-props:def-desig-package cram-tutorial-executive
  (:use #:roslisp #:cram-utilities
        #:cram-transforms-stamped #:cram-designators
        #:cram-plan-knowledge #:cram-plan-library #:cpl)
  (:import-from #:cram-prolog #:<- #:def-fact-group)
  (:desig-properties #:to #:perceive #:obj #:ground
                     #:type #:box #:bowl #:cutlery
                     #:color #:red #:white #:blue #:green
                     #:move #:at #:loc
                     #:name #:container #:category #:owner #:cornflakes
                     #:pose))
