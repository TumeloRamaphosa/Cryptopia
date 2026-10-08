# Payment rail (locked)

> **Status: LOCKED.** Changes require Tumelo's approval. Propose, do not apply.

1. Member pays fiat (USD / ZAR / EUR)
2. Regulated on-ramp → **USDC / USDT**
3. **Goods settlement = USDC/USDT 1:1**
4. Studex utility token = membership / AI+cloud usage / Execution Exchange metering only
5. Member Studex Wallet

## Why it is shaped this way

**Goods settle in stablecoin, not in the token.** A token that settles goods has to hold its
value through the settlement window or the trade breaks. Stablecoins are built for exactly that
and nothing else. The token's job is metering platform usage — membership, AI and cloud, and
Execution Exchange — where a fluctuating price is a feature, not a defect.

**Fiat enters through a regulated on-ramp.** Not peer-to-peer, not an offshore venue. The on-ramp
is the compliance surface, and it is the reason the rail can be described to a regulator at all.

**Five steps, in order.** Each step has one job. Collapsing step 2 into step 3, or step 4 into
step 3, is what produces the failure mode where nobody can say which currency settled a trade.

## The invariant

For every settled order, these three must be equal:

```
goods_settled_value  ==  onramp_fiat_in  ==  stablecoin_moved
```

A break is not a rounding issue to smooth over. It is a finding to report with the earliest
ledger entry that diverges, the magnitude, and a proposed correcting journal entry for a human
to release.

## Not the rail

- ETH wallet alone ≠ StudEx RFQ / goods settlement (fine for CashClaw / Moltlaunch side work)
- Shopify on `studexmeat.com` completes Meat *retail* checkouts
- ApeClaw / CashClaw = agent work loop + audit, not cargo P&L

These are not wrong; they are just not this. Mixing them into the rail is how a clean design
becomes an unexplainable one.

## Cross-border, before you quote

The rail is designed for cross-border agricultural trade. Before quoting any B2B corridor,
establish the counterparty's **entity type**, not just their jurisdiction:

- Under South Africa's **draft** cross-border framework, **resident entities are prohibited**
  from cross-border crypto transactions classified as import or export of capital. Only
  individuals may externalise, within the allowances.
- The draft instruments closed for comment but are **not in force** — they read as having the
  effect of law once they are, so design assumptions should track them.
- The prescribed sequence is licence → registration → cross-border application → conditional
  approval → compliance window. No processing timeframe is published.

A route check that cannot cite the rule is a refusal, not a guess. **Draft ≠ law**, and a closed
comment window is not an enactment date.

## Gates

Nothing on this rail moves without a named human: no payment initiation, no custody movement,
no entitlement grant, no live order. Agents propose, reconcile and evidence.
