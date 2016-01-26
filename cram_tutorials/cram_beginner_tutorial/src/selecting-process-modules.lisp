(in-package :tut)

(cram-prolog:def-fact-group navigation-action-designator (action-desig)
  (cram-prolog:<- (action-desig ?designator (navigation ?goal))
  (desig-prop ?designator (type navigation))
  (desig-prop ?designator (goal ?goal))))

(cram-process-modules:def-process-module turtle-navigation-handler (action-designator)
  (roslisp:ros-info (turtle-process-modules)
                    "Turtle navigation invoked with action designator `~a'."
                    action-designator)
  (destructuring-bind (cmd action-goal) (reference action-designator)
    (ecase cmd
        (navigation
          (print (cl-transforms:origin (reference action-goal)))
          (move-to (cl-transforms:origin (reference action-goal)))))))

(cram-prolog:def-fact-group turtle-navigation (cram-process-modules:matching-process-module
                                   cram-process-modules:available-process-module)
  (cram-prolog:<- (cram-process-modules:matching-process-module ?designator turtle-navigation-handler)
    (desig-prop ?designator (type navigation)))
  (cram-prolog:<- (cram-process-modules:available-process-module turtle-navigation-handler)))

(cram-prolog:def-fact-group turtle-actuators (cram-process-modules:matching-process-module
                                  cram-process-modules:available-process-module)
  (cram-prolog:<- (cram-process-modules:matching-process-module ?designator turtle-actuators)
    (desig-prop ?designator (type shape)))
  (cram-prolog:<- (cram-process-modules:available-process-module turtle-actuators)))

(defun do-action-designator (action-desig)
  (let ((turtle-name "turtle1"))
    (start-ros-node turtle-name)
    (init-ros-turtle turtle-name)
    (top-level
      (cpm:with-process-modules-running (turtle-navigation-handler turtle-actuators)
        (cram-plan-library:perform action-desig)))))

