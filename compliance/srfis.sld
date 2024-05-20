;; SRFI lists.
;; SPDX-License-Identifier: MIT

(define-library (compliance srfis)
  (export all-srfis final-srfis withdrawn-srfis
          make-srfi srfi?
          srfi-number srfi-status srfi-title srfi-author srfi-library-name
          srfi-see-also srfi-keywords srfi-draft-date srfi-done-date)
  (import (scheme base))
  (begin

    (define srfi-data (include "srfi-data.scm"))

    (define-record-type <srfi>
      (make-srfi number status title author library-name see-also keywords
                 draft-date done-date)
      srfi?
      (number srfi-number)
      (status srfi-status)
      (title srfi-title)
      (author srfi-author)
      (library-name srfi-library-name)
      (see-also srfi-see-also)
      (keywords srfi-keywords)
      (draft-date srfi-draft-date)
      (done-date srfi-done-date))

    (define (assoc-ref key alist)
      (let ((pair (assoc key alist)))
        (if pair
            (if (> (length pair) 2)
                (cdr pair)
                (cadr pair))
            #f)))

    (define (alist->srfi alist)
      (make-srfi (assoc-ref 'number alist)
                 (assoc-ref 'status alist)
                 (assoc-ref 'title alist)
                 (assoc-ref 'author alist)
                 (assoc-ref 'library-name alist)
                 (assoc-ref 'see-also alist)
                 (assoc-ref 'keywords alist)
                 (assoc-ref 'draft-date alist)
                 (assoc-ref 'done-date alist)))

    (define all-srfis (map alist->srfi srfi-data))

    (define final-srfis (filter (lambda (srfi)
                                  (eq? (srfi-status 'final)))
                                all-srfis))

    (define withdrawn-srfis (filter (lambda (srfi)
                                      (eq? (srfi-status 'withdrawn)))
                                    all-srfis))))
