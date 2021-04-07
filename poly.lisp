(defun poly+ (p1 p2)(let ((result (sort-terms (append p1 p2))))
                    (collect-terms (list(car result)) (cdr result))))

(defun collect-terms (p1 p2)(cond ((equal 0 (caar p1)) (collect-terms (cdr p1) p2))
                                  ((equal 0 (caar p2)) (collect-terms p1 (cdr p2)))
                                     ((and (null (car p1)) 
                                            (null(car p2))) nil) 
                                  ((null (car p2)) p1)
    (t (collect-terms (term+poly (car p2) p1) (cdr p2)))))


(defun term+poly (t1 p1)(cond((null p1) (list t1)) 
                             ((equal (cdar p1) (cdr t1))
                                (if (equal 0 (+ (caar p1) (car t1)))
                                                            (cdr p1)
                                (cons (cons (+ (caar p1) (car t1)) (cdr t1)) (cdr p1))))
    (t (cons (car p1) (term+poly t1 (cdr p1))))))


(defun poly* (p1 p2)(let ((result (sort-terms (poly*poly p1 p2))))
    (collect-terms (list(car result))(cdr result))))


(defun poly*poly (p1 p2)(cond((or (null (car p1)) 
                                  (null (car p2))) nil)
    (t (append (term*poly (car p1) p2) (poly*poly (cdr p1) p2)))))


(defun term*poly (t1 p1)(cond((null p1) nil)
    (t (cons (term*term t1 (car p1)) (term*poly t1 (cdr p1))))))


(defun term*term (t1 t2)(cond((null t1) t2)
                             ((and (atom (car t1))(atom (car t2))) 
                             (cons (* (car t1) (car t2)) (term*term (cdr t1) (cdr t2))))
    (t (term*term (cdr t1) (var*term (car t1) t2)))))


(defun var*term (v1 t1)(cond((null t1) (list v1))
                            ((equal (car v1)(caar t1))
                            (cons (list (car v1) (+ (cadr v1)(cadar t1))) (cdr t1)))
    (t (cons (car t1) (var*term v1 (cdr t1))))))



(defun poly- (p1 p2)(poly+ p1 (poly* '((-1)) p2)))

(defun sortpol (t1)(cond((null t1) t1)
                            ((atom (car t1)) (cons (car t1) (sortpol (cdr t1))))
                            ((equal 1 (list-length t1)) t1)
                            ((string<= (caar t1) (caadr t1))
                            (recheck (cons (car t1) (sortpol (cdr t1)))))
    (t (recheck (cons (cadr t1) (sortpol (cons (car t1) (cddr t1))))))))


(defun recheck (t1)(if (string<= (caar t1) (caadr t1)) t1 (sort t1)))

(defun sort-terms (p1)(map 'list #'sortpol p1))
  
  (setq p1 '((3(x 2)) (4(y 1)) (-1) (2(x 2)) (2(y 2))))
  (setq p2 '((1)))
  (print (poly* p1 p2))
