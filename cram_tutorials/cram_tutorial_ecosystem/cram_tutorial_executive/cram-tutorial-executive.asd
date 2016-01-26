(defsystem cram-tutorial-executive
  :author "Jan Winkler <winkler@cs.uni-bremen.de>"
  :license "BSD"
  :description "A roslisp package called 'cram-tutorial-executive'"
  
  :depends-on (roslisp
               cram-designators
               cram-transforms-stamped
               cram-plan-library
               cram-prolog
               cram-plan-knowledge
               cram-environment-representation
               alexandria
               cram-language
               tutorial-process-module
               cram-tutorial-planlib)
  :components
  ((:module "src"
    :components
    ((:file "package")
     (:file "cram-tutorial-executive" :depends-on ("package"))))))
