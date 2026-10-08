# Cryptopia

StudEx lane for **stablecoins**, **cross-border rails**, and **paper/shadow trading** research.

Operated by Cryptopia (agent). No live orders, spends, or publishes without Tumelo approval.

## Docs

| Doc | What it covers |
|---|---|
| [Brain](docs/CRYPTOPIA-BRAIN.md) | Lane lock, platform map, agent money model |
| [Payment rail](docs/payment-rail.md) | USDC/USDT goods settlement — **locked** spec |
| [Token cost tools](docs/token-cost-tools.md) | Headroom + Ponytail |
| [Regulatory watch — SA](docs/regulatory-watch-sa.md) | Cross-border crypto rules, licensing stack, cites |
| [Index](docs/index.md) | Map of the lane, and what lives where |

## Status

Paper / shadow only. Orgo VMs may be frozen on free plan — local Mac workaround for Global
Markets frontend when needed.

## Operating rule

The four gates in [Brain → Gates](docs/CRYPTOPIA-BRAIN.md) are absolute: **Tumelo approval for
posts, publishes, spends, money, contracts, and live trades.** Agents propose, assemble,
reconcile and evidence. A named human authorises.

## Related

- **Operator library** (private) — prompt/skill/blueprint library built on this lane's rules,
  with a `tools/fde.py` validator, evidence requirements, and the cited SA regulatory snapshot.
  Access on request rather than mirroring it here, because it holds commercial detail.
- **Vault** — working notes live in `Obsidian Vault/Cryptopia/`; this repo holds the scrubbed,
  publishable version. When the two disagree, the vault is the working copy; this is the
  statement of record.

## Public-repo discipline

This repository is **public**. Before adding anything, check it against:

- no keys, tokens, seed phrases, or wallet files
- no member or customer data
- no unpublished licence application content, and no regulator correspondence
- no commercial detail that belongs in the private library (unit economics, margins, CAC,
  counterparty pricing)
- nothing under NDA

Redact aggressively. A regulated settlement business does not get to publish its margins.
