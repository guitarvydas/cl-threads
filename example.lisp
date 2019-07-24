(in-package :cl-threads)

;; don't expect to see optimal code here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   top-level (architecture level for the example)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun @main ()
  (format *standard-output* "starting...~%")
  (@create-example-threads-and-put-them-into-a-list)
  (@initialize-and-start-scheduler)
  (@start-example)
  (@run-scheduler-loop-forever-or-until-example-quits))

(defun @run-scheduler-loop-forever-or-until-example-quits ()
    (@loop
      (@send-trigger-message-to-every-process)
      (@run-scheduler-once)
      (@slow-down-to-human-speeds)
      (@exit-when (or
                   (@stop-example-p)
                   (@has-run-enough-times 10)))
    (@end-loop)))
  
   
