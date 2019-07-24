(in-package :cl-threads)

(defun closure1 ()
  (lambda (message)
    (declare (ignore message))
    (format *standard-output*  "lambda 1~%")))

(defun closure2 ()
  (lambda (message)
    (declare (ignore message))
    (format *standard-output*  "lambda 2~%")))

(defun closure3 ()
  (lambda (message)
    (declare (ignore message))
    (format *standard-output*  "lambda 3~%")))

(defun closure4()
  (lambda (message)
    (declare (ignore message))
    (format *standard-output*  "lambda 4~%")))

