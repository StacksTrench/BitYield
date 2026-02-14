;; Yield Optimizer
;; Automatically optimizes yield across protocols

(use-trait strategy-trait .strategy-template.strategy-trait)

(define-constant contract-owner tx-sender)
(define-data-var current-strategy uint u1)
(define-data-var total-deposits uint u0)
(define-data-var last-harvest uint u0)
(define-data-var active-strategy-principal principal tx-sender)

(define-map user-deposits principal uint)

(define-read-only (get-optimal-yield)
  (var-get current-strategy)
)

(define-public (set-strategy (new-strategy <strategy-trait>))
  (begin
    (asserts! (is-eq tx-sender contract-owner) (err u100))
    (var-set active-strategy-principal (contract-of new-strategy))
    (ok true)
  )
)

(define-public (deposit-for-optimization (amount uint))
  (begin
    (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
    (map-set user-deposits tx-sender (+ (default-to u0 (map-get? user-deposits tx-sender)) amount))
    (var-set total-deposits (+ (var-get total-deposits) amount))
    (ok amount)
  )
)

(define-public (harvest (strategy <strategy-trait>))
  (let (
      (timestamp stacks-block-time)
    )
    ;; Verify strategy matches active one
    (asserts! (is-eq (contract-of strategy) (var-get active-strategy-principal)) (err u101))

    ;; 1. Claim rewards from current strategy
    (unwrap! (contract-call? strategy harvest) (err u102))
    
    ;; 2. Swap rewards to base asset
    ;; (contract-call? .dex swap ...)

    ;; 3. Re-invest
    (var-set last-harvest timestamp)
    (ok timestamp)
  )
)

(define-public (rebalance-strategy (new-strategy uint))
  (begin
    (asserts! (is-eq tx-sender contract-owner) (err u100))
    (var-set current-strategy new-strategy)
    (ok true)
  )
)
