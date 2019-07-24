(in-package :cl-threads)

;; don't expect to see optimial code here

(defclass thread ()
  ((inqueue :accessor inqueue)
   (closure :accessor closure)))

(defmethod initialize-instance :after ((self thread) &key func)
  (setf (inqueue self) (make-instance 'queue)
        (closure self)  func))

(defmethod input-queue-empty-p ((process thread))
  (q-empty-p (inqueue process)))

(defmethod message-pop ((process thread))
  (q-pop (inqueue process)))

(defmethod message-push ((process thread) message)
  (q-push (inqueue process) message))

        




        

