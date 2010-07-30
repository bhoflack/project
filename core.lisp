(defclass questionnaire ()
  ((id        :accessor id        :initarg :id)
   (name      :accessor name      :initarg :name)
   (version   :accessor version   :initarg :version)
   (published :accessor published :initarg :published)
   (questions :accessor questions :initarg :questions)))

(defclass question ()
  ((id       :accessor id       :initarg :id)
   (question :accessor question :initarg :question)
   (check    :accessor check    :initarg :check)
   (answer   :accessor answer   :initarg :answer)
   (comments :accessor comments :initarg :comments)))

; dao


; service
(defun create-questionnaire (name questions)
  (make-instance 'questionnaire :name name :questions questions))

(defun create-question (question check &optional answer comments)
  (make-instance 'question :question question :check check :answer answer :comments comments))

(defun add-question-to-questionnaire (questionnaire question)
    (progn
      (push question (questions questionnaire))
      questionnaire))

(defun append-to-position (element position elements)
  "Append a element to a defined position"
  (append (butlast elements (- (list-length elements) position)) 
	  (cons element (nthcdr position elements))))

(defun move-element-to-position (element position elements)
  (append-to-position element position (remove element elements)))

(defun move-question-to-position (questionnaire question position)
  (progn
    (setf (questions questionnaire) 
	  (move-element-to-position question position (questions questionnaire)))
    questionnaire))
	 
   