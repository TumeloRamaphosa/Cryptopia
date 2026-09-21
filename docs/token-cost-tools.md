# Headroom + Ponytail — how they cut token cost

## Headroom (infra proxy)
- Compresses tool outputs, logs, files, RAG, history *before* they hit the LLM
- Also can trim model *output* ceremony / lower effort on routine tool resumes
- On Mac: `~/Projects/headroom` — wrap agents with `headroom wrap openclaw|hermes|…`
- Best on long, tool-heavy runs (~20–40% fewer billed tokens in independent heavy benchmarks)
- Caveat: can bust prompt cache → check bill, not just token counters (`headroom savings`)

## Ponytail (skill / YAGNI ladder)
- Skill that forces laziest working solution: no over-build → less code → fewer tokens
- Install: `clawhub install ponytail` or copy to `~/.openclaw/skills/ponytail`
- Commands: `/ponytail lite|full|ultra`, `/ponytail-review`, `/ponytail-audit`
- Claims ~20% cost cut; independent tests ~10% cost / ~15% less code — still a real save
- Use with Hermes/OpenClaw coding tasks; not for pure research prose

## Together for StudEx army
1. Headroom wraps the gateway (Hermes → Model House / OpenClaw) → shrink context
2. Ponytail on coding agents → they write less → burn fewer output tokens
3. Model House local models for cheap routine work; expensive models only for hard decisions
