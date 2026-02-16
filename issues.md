# Project Roadmap & Issues - BitYield 📈

This document tracks the development of the BitYield yield optimizer.

---

## 🚀 Priority: Critical

### Issue #1: Harvest Logic
**Status:** ✅ COMPLETED
**Description:** Implement harvest function structure.
- **Tasks:**
  - [x] Implement `harvest` stub.
  - [x] Track `last-harvest` time.

### Issue #2: Strategy Interface
**Status:** ✅ COMPLETED
**Description:** Define standard trait for strategies.
- **Tasks:**
  - [x] Create `strategy-trait`.

### Issue #3: Strategy Integration
**Status:** ✅ COMPLETED
**Description:** Connect `yield-optimizer` to a concrete strategy.
- **Tasks:**
  - [x] Implement `set-strategy` function.
  - [x] Call strategy during harvest.

---

## 🛠️ Smart Contract Tasks

### Issue #4: Auto-Compounding
**Status:** ✅ COMPLETED
**Description:** Automate the reinvestment loop.
- **Tasks:**
  - [x] Calculate compound frequency.
  - [x] Split rewards for gas/fee.

### Issue #5: Multi-Vault Support
**Status:** ❌ PENDING
**Description:** Support multiple assets (STX, ALEX, USDA).
- **Tasks:**
  - [ ] Create vault factory pattern.

---

## 🎨 Frontend Tasks

### Issue #6: Yield Dashboard
**Status:** ❌ PENDING
**Description:** User interface for deposits.
- **Tasks:**
  - [ ] Display TVL and APY.
  - [ ] Deposit/Withdraw modal.

---

## ✅ Completed Milestones
- [x] Project Scaffold
- [x] Basic Contract Logic
- [x] Strategy Trait
