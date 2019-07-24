(defsystem "cl-threads"
  :serial t 
  :components ((:module "source"
                        :pathname "./"
                        :components ((:file "package")
                                     (:file "loop-macros")
				     (:file "queue")
                                     (:file "thread")
                                     (:file "scheduler")
                                     (:file "lambdas")
                                     (:file "example-support")
                                     (:file "example")))))
