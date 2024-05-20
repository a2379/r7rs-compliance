;; List of implementations and their metadata.
;; SPDX-License-Identifier: MIT

(define-library (compliance implementations)
  (export make-implementation implementation? implementation-name
          implementation-executable implementation-r7rs-flag
          chibi chicken cyclone gambit gauche gerbil guile kawa loko mit mosh
	  racket s7 sagittarius stklos ypsilon)
  (import (scheme base))
  (begin

    (define-record-type <implementation>
      (make-implementation name executable)
      implementation?
      (name implementation-name)
      (executable implementation-executable)
      (r7rs-flag implementation-r7rs-flag))

    ;; TODO: Right now "" for r7rs-flags indicates R7RS is not the default,
    ;; but there is no CLI flag to turn on R7RS compatibility.
    (define chibi (make-implementation "Chibi" "chibi-scheme" #f))
    (define chicken (make-implementation "Chicken" "csi" ""))
    (define chicken (make-implementation "Cyclone" "cyclone" #f))
    (define chicken (make-implementation "Gambit" "gsi" "-:r7rs"))
    (define gauche (make-implementation "Gauche" "gosh" "--r7rs"))
    (define gerbil (make-implementation "Gerbil" "gxi" "--lang r7rs"))
    (define guile (make-implementation "Guile" "guile3" "--r7rs"))
    (define kawa (make-implementation "Kawa" "kawa" #f))
    (define loko (make-implementation "Loko" "loko" "-std=r7rs"))
    (define mit (make-implementation "MIT" "scheme" "-std=r7rs"))
    (define mosh (make-implementation "Mosh" "mosh" ""))
    (define racket (make-implementation "Racket" "racket" ""))
    (define s7 (make-implementation "S7" "s7" "repl"))
    (define sagittarius (make-implementation "Sagittarius" #f))
    (define stklos (make-implementation "STklos" "stklos" #f))
    (define tiny (make-implementation "Tiny" "scheme" #f))
    (define unsyntax (make-implementation "Unsyntax" "unsyntax-scheme" #f))
    (define ypsilon (make-implementation "Ypsilon" "ypsilon" "--r7rs"))
    ))
