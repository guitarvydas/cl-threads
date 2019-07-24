(in-package :cl-threads)

(defun initialize-and-start-scheduler ()
  "start the scheduler on the list of processes"
  ;; nothing to do here
)
  
(defun sched-one (process)
  "run process if its input queue is not empty"
  (when (not (input-queue-empty-p process))
    (let ((message (message-pop process)))
      (funcall (closure process) message))))

(defun schedule-one-process (p)
  (sched-one p))

(defun schedule-once (thread-list)
  "try to run all processes in thread-list, once"
  (mapc-random #'sched-one thread-list))

(defun mapc-random (func lis)
  (when lis
    (let ((item (nth (random (length lis)) lis)))
      (funcall func item)
      (mapc-random func (remove item lis)))))

  
