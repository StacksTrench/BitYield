;; Yield Optimizer
;; Automatically optimizes yield across protocols

(use-trait strategy-trait .strategy-template.strategy-trait)

(define-constant contract-owner tx-sender)
(define-data-var current-strategy uint u1)
(define-data-var total-deposits uint u0)
(define-data-var last-harvest uint u0)
(define-data-var active-strategy-principal principal tx-sender)
(define-data-var fee-bips uint u50) ;; 0.5% fee

(define-map user-deposits principal uint)

(define-read-only (get-optimal-yield)
  (var-get current-strategy)
)

(define-read-only (calculate-compound-frequency)
  ;; Logic: (Gas Cost / Yield Rate) ^ 0.5
  ;; Placeholder: 144 blocks (~1 day)
  u144
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
    (let (
        (harvested-amount (unwrap! (contract-call? strategy harvest) (err u102)))
        (fee-amount (/ (* harvested-amount (var-get fee-bips)) u10000))
        (reinvest-amount (- harvested-amount fee-amount))
      )
        ;; 2. Logic to swap/reinvest would go here
        
        ;; 3. Update state
        (var-set last-harvest timestamp)
        (ok reinvest-amount)
    )
  )
)

(define-public (rebalance-strategy (new-strategy uint))
  (begin
    (asserts! (is-eq tx-sender contract-owner) (err u100))
    (var-set current-strategy new-strategy)
    (ok true)
  )
)
