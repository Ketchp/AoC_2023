;gnu clisp  2.49.60
(defun my-split (string &key (delimiterp #'delimiterp))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))
(defun delimiterp (c) (position c ":"))

(defun my-split2 (string &key (delimiterp #'delimiterp2))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))
(defun delimiterp2 (c) (position c ";"))

(defun my-split3 (string &key (delimiterp #'delimiterp3))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))
(defun delimiterp3 (c) (position c ","))

(defun my-split4 (string &key (delimiterp #'delimiterp4))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))
(defun delimiterp4 (c) (position c " "))


(let ((total 0)
      (game 0))
(loop
    (let ((line (read-line *query-io* nil)))
      (if (not line)
          (progn
              (print total)
              (return)
          )
          (progn
              (format t "Line: ~a~%" line)
              (format t "Game: ~s~%" game)
              (incf game)
              (setq line (car (last (my-split line))))
              (setq ok 1)
              (dolist (draw (my-split2 line))
                  (dolist (dices (my-split3 draw))
                      (progn
                          (setq temp (my-split4 dices))
                          (setq dice_cnt (parse-integer (car temp)))
                          (setq dice_col (car (last temp)))
                          (if (and (string= dice_col "red") (> dice_cnt 12))
                              (setq ok 0)
                          (if (and (string= dice_col "green") (> dice_cnt 13))
                              (setq ok 0)
                          (if (and (string= dice_col "blue") (> dice_cnt 14))
                              (setq ok 0)
                          )))
                          (format t "Count: ~a, color: ~a ~a ~%" dice_cnt dice_col ok)
                      )
                  )
              )
              (if (= ok 1)
                  (setq total (+ total game))
              )
              (format t "Total: ~a ok: ~a~%" total ok)
          )
       )
     )
)
)
