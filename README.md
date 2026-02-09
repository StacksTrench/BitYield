# BitYield 📈

**Automated Yield Optimizer for Bitcoin DeFi on Stacks.**

BitYield aggregates user funds and deploys them into the highest-yielding strategies across the Stacks ecosystem (Lending, Liquidity Provision, Staking), auto-compounding rewards to maximize APY.

## 🚀 Features

### 🔄 Auto-Compounding
- **Harvest & Reinvest:** Automatically claims rewards (e.g., ALEX, DIKO) and reinvests them into the principal position.
- **Frequency Optimization:** Calculates optimal compound frequency based on gas costs.

### 🧠 Strategy Router
- **Best Yield Search:** Dynamically moves capital between pools (e.g., STX-ALEX vs STX-sBTC) based on real-time APY.
- **Risk-Adjusted Return:** Factors in the `StacksGuard` risk score before deploying capital.

### 💼 Vault Architecture
- **Single Asset Vaults:** Deposit STX, receive `stSTX` (Share Token).
- **Strategy Adapters:** Modular contracts that interface with specific external protocols.

## 🏗️ Technical Architecture

### Smart Contracts (`/smartcontract`)
- **`yield-optimizer.clar`**: The main vault logic handling deposits, withdrawals, and share calculation.
- **`strategy-*.clar`**: (Future) Individual adapters for external protocols.

### Frontend (`/frontend`)
- **Yield Dashboard:** View current APY, TVL, and personal earnings.
- **Zap In:** One-click deposit from any asset.

## 📦 Deployment

```bash
git clone https://github.com/StacksTrench/BitYield.git
cd BitYield/smartcontract
clarinet check
```

## 🤝 Contributing
Strategies must be audited before integration.
