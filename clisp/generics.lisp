(defgeneric genfunc (object)
  (:documentation "Print an object in a class dependent way"))

(defclass sample () 
  ((value :initarg :value :initform 0 :reader value :writer (setf value))))

(defmethod genfunc ((object t))
  (format t "The root version: ~a~%" object))

(defmethod genfunc ((object sample))
  (format t "The sample version: ~r~%" (value object)))

(genfunc "Some Test")
(genfunc (make-instance 'sample :value 2343))
 