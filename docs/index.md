# Cryptopia — lane index

> Map of the lane. What lives here, what lives elsewhere, and why.
> *Maintained 2026-10-08. Scrubbed for a public repo.*

---

## 1. What this repo is

The **statement of record** for the Cryptopia lane: the locked rail, the lane boundary, the
gates, and the reference notes the agents run against. It is deliberately small and deliberately
scrubbed.

It is **not** the working copy. Working notes live in `Obsidian Vault/Cryptopia/`. Where the two
disagree, the vault is right and this repo is out of date — fix it.

---

## 2. The lane boundary

| In the lane | Out of the lane |
|---|---|
| Stablecoin settlement (USDC/USDT 1:1 for goods) | ETH wallet alone as a settlement rail |
| Cross-border rail design and jurisdiction analysis | Retail meat checkout (Shopify on `studexmeat.com`) |
| Paper / shadow trading research | Agent work loops (CashClaw / ApeClaw) as cargo P&L |
| Member wallet lane design | Platform products that are not the rail |
| Regulatory monitoring for the corridors | Anything requiring a live order to test |

The single most useful sentence in the whole lane: **the token meters platform usage; it does
not settle goods.** USDC/USDT settle goods. Confusing those two is the fastest way to build the
wrong thing.

---

## 3. Documents

| File | Status | Notes |
|---|---|---|
| `CRYPTOPIA-BRAIN.md` | living | lane lock, platform map, agent money model, gates |
| `payment-rail.md` | **locked** | the 5-step rail. Changes require Tumelo's approval |
| `token-cost-tools.md` | reference | Headroom + Ponytail. External claims carried with provenance |
| `index.md` | this file | the map |

"Locked" means: propose a change, don't apply one. The rail is the thing every other document
depends on.

---

## 4. Where the rest lives

```
Obsidian Vault/Cryptopia/          working notes, dated
  ├── 2026-09-14-Stablecoins-and-Platform.md    market + platform snapshot
  └── 2026-09-21-Headroom-Ponytail-Token-Costs.md

private operator library            prompts, skills, blueprints, validator, evidence rules
  ├── skill.md                      atomic capability registry
  ├── blueprints.md                 session blueprints
  ├── rules.md                      operator framing, draft-vs-law, authorisation
  └── prompts/research/…            cited regulatory snapshot, kept current
```

Commercial detail — unit economics, margins, counterparty pricing, acquisition cost — belongs
in the **private** library and not here. This repo is public.

---

## 5. The four gates

No agent action crosses these without a named human:

1. **Money** — no payment initiation, no custody movement, no spend
2. **Access** — no entitlement grant, no account provisioning
3. **Market** — no live order, no live trading flag
4. **Voice** — no post, publish, or regulator submission

Everything else an agent may do freely, provided it produces evidence.

---

## 6. Where this lane connects to the rest of StudEx

| Connection | Nature | Care needed |
|---|---|---|
| **Meat / `studexmeat.com`** | Shopify completes retail checkouts; the rail is for goods settlement at trade scale | Keep the two settlement paths distinct in every document |
| **Global Markets** | RFQ and consignment orders need a settlement path; the rail is the candidate | A quote that assumes the rail works is a draft, not an offer |
| **Coffee / Rwanda** | Cross-border agricultural trade is the first real use case for the rail | Entity-type restrictions bite hardest on B2B agricultural settlement — check before quoting |
| **Arcade / Agentic Rise** | Platform usage metered in the token lane | Metering is not settlement |
| **Dark Factory** | Build capacity for the lane's own tooling | Nothing here ships without the gates |

The rail exists to serve these. If a connection cannot settle through it as structured, that is
a finding to report, not a workaround to build.

---

## 7. Open questions

Tracked here rather than in a chat, so they stop being re-asked:

- [ ] **Jurisdiction** — where is the exchange licensed, and does the answer hold for the
      corridors actually being used? *(CEO decision)*
- [ ] **Budget and window** — what is the capital envelope and the target date? *(CEO decision)*
- [ ] **Workstream owner** — who owns licensing versus build versus GTM? *(CEO decision)*
- [ ] **Procurement** — vendor ontology platform, or this lane's own stack? *(CEO decision)*
- [ ] **Cross-border entity restriction** — the draft SA framework restricts resident entities
      from cross-border crypto classified as import/export of capital. Determine the effect on
      the B2B agricultural corridors before any of them are quoted. *(Compliance)*

---

## 8. Maturity labels

Used consistently across the lane so nobody mistakes a plan for a result:

| Label | Means |
|---|---|
| **locked** | decided; changing it requires Tumelo's approval |
| **verified** | run against real inputs, with an artefact that exists |
| **experimental** | partially validated; real inputs, incomplete field evidence |
| **conceptual** | a design pattern or hypothesis, never executed |

Never promote a `conceptual` item to `verified` because it reads well.
