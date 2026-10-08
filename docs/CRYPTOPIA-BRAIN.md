# Cryptopia Brain — StudEx stablecoins / cross-border / agent rails
*Source: Cryptopia · scrubbed · 2026-09-21*
*Reviewed 2026-10-08 — additions marked.*

## Lane

Stablecoins, cross-border rails, exchange/chain research. Paper/shadow only until Tumelo clears
live orders/spend/publish.

**Lane boundary** (added 2026-10-08). In: stablecoin settlement, cross-border rail design and
jurisdiction analysis, paper/shadow trading research, member wallet lane design, regulatory
monitoring. Out: ETH-wallet-only settlement, retail meat checkout, agent work loops as cargo P&L.
See `index.md` §2.

## Payment rail

Fiat → on-ramp → **USDC/USDT 1:1 goods settlement** → Studex token for platform usage → Member
wallet. Full spec, locked, in [`payment-rail.md`](payment-rail.md).

The line that matters: **the token meters platform usage; it does not settle goods.** USDC/USDT
settle goods.

## Top stables (~Sep 2026)

USDT ~60%, USDC ~24–25%. Watch MiCA, US GENIUS, HK licensing, SA draft corporate cross-border
rules.

## Mac platform map

- `~/studex-trading-desk` — FastAPI desk (paper)
- `~/agents-dr/Stud-Ex-Global-Markets` — Next.js + Firebase MVP
- `~/Desktop/Global Market/` — coffee/grain data

## StudBot vs platform

StudBot = Ghost + Private VM + Agent OS + AI workforce (SKU). Not Global Markets / Arcade / Meat.

## Agent stack

- CashClaw: take task → work → get paid (not goods P&L)
- ApeClaw: skills/pods + onchain receipts (audit/marketplace)
- Hermes + Model House `:4000`: local LLM gateway
- OpenClaw: channel/runtime
- Vibe Trading: paper FX + coffee signals only

## Token cost

- **Headroom**: compress context before LLM
- **Ponytail**: YAGNI skill → less code → fewer output tokens

Caveat carried from `token-cost-tools.md`: compression can bust prompt caching, so measure the
**bill**, not the token counter.

## Gates

Tumelo approval for posts, publishes, spends, money, contracts, live trades.
