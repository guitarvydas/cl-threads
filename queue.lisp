(in-package :cl-threads)

;; don't expect to see optimal code here

(defclass queue ()
  ((q-list :initform nil :accessor q-list)))

(defmethod q-empty-p ((q queue))
  (null (q-list q)))

(defmethod q-push ((q queue) datum)
  (setf (q-list q) (if (q-empty-p q)
                       (list (list datum))
                     (append (q-list q) (list (list datum))))))

(defmethod q-pop ((q queue))
  (assert (q-list q))
  (let ((list-of-result (pop (q-list q))))
    (let ((result (first list-of-result))) ;; we alway push a list of datum (/data), so we need to un-list it here
      result)))


        




        

