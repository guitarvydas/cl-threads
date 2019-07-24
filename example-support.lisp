(in-package :cl-threads)

;; don't expect to see optimal code here

(defparameter *run-example* nil) ;; flag to stop example
(defparameter *counter* 0) ;; used to determine how many times example has run
(defparameter *global-list-of-processes* nil)

;; mechanisms
(defun @create-example-threads-and-put-them-into-a-list ()
  "create some example processes, string them together onto *global-list-of-processes*"
  (let ((t1 (make-instance 'thread :func (closure1)))
        (t2 (make-instance 'thread :func (closure2)))
        (t3 (make-instance 'thread :func (closure3)))
        (t4 (make-instance 'thread :func (closure4))))
    (let ((list-of-processes (list t1 t2 t3 t4)))
      (setf *global-list-of-processes* list-of-processes))))
        
(defun @initialize-and-start-scheduler ()
  "start the scheduler on the list of processes"
  (initialize-and-start-scheduler))

(defun send-trigger (process)
  ;; content of message doesn't matter - it could be nil, too - the only thing that
  ;; matters is the fact that a message (any message) has been sent
  (message-push process t))

(defun @send-trigger-message-to-every-process ()
  (mapc #'send-trigger *global-list-of-processes*))

(defun @start-example ()
  (setf *run-example* t)
  (setf *counter* 0))

(defun @run-scheduler-once ()
  "try running every process (to completion) once"
  (schedule-once *global-list-of-processes*))

(defun kill-example ()
  (format *standard-output* "stopping example...~%")
  (setf *run-example* nil))

(defun @stop-example-p ()
  (not *run-example*))

(defun @has-run-enough-times (n)
  (incf *counter*)
  (format *standard-output* "run ~A times ~%" *counter*)
  (when (= *counter* n)
    (kill-example)))

(defun @slow-down-to-human-speeds ()
  (sleep 1))
