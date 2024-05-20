;; Compliance tests.
;; SPDX-License-Identifier: MIT

(define-library (compliance tests)
  (export make-ctest ctest?
          ctest-name ctest-description ctest-max-score ctest-expr
          all-ctests
          r7rs-default
          srfi-ctest
          non-withdrawn-srfi-ctest
          version-ctest)
  (import (scheme base)
          (compliance srfi))
  (begin

    ;; ctest-proc has the signature:
    ;; (define (proc impl) ...)
    (define-record-type <ctest>
      (make-ctest name description max-score expr higher-is-better?)
      (name ctest-name)
      (description ctest-description)
      (max-score ctest-max-score)
      (proc ctest-expr)
      (higher-is-better? ctest-higher-is-better?))

    (define (srfi-proc impl)
      0)

    (define srfi-ctest
      (make-ctest "SRFI availability"
                  "The number of finalized SRFIs available by default."
                  (length final-srfis)
                  srfi-proc
                  #t))

    ))
