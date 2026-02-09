(define-trait strategy-trait
  (
    (deposit (uint) (response uint uint))
    (withdraw (uint) (response uint uint))
    (harvest () (response uint uint))
    (get-balance () (response uint uint))
  )
)
