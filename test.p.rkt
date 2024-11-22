
; create a temp directory tempdir=`mktemp -d` (use a tempdir so we can retain original file name)
; remove ;# comments from production code with `awk '{ sub(/^;#/, ""); print }' test.p.rkt` > "$mydir"/test.p.rkt`
; reveal production code with `preprocess -DPRODUCTION  -o test.rkt "$mydir"/test.p.rkt`

(provide

; #ifndef PRODUCTION

	;; inline documentation and contract
	(proc-doc/names  events-count (->* ( (vectorof event?)  () exact-nonnegative-integer?)
         	        ((events) ())
           	        @{ returns the length of a vector of events })

; #else
; lines to be included in production, commented out with special `;#` token that must be removed first
; remove ;# with awk '{ sub(/^;#/, ""); print }'

;#	;; export function without contract
;#	events-count 

; #endif

) ; end provide