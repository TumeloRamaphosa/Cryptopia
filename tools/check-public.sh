#!/usr/bin/env bash
# Public-repo guard for Cryptopia.
#
# This repo is PUBLIC. Run this before every commit. It fails the commit on anything that
# should not be published: keys, wallet material, member data, regulator correspondence,
# commercial detail, or infrastructure addresses.
#
#   ./tools/check-public.sh          # scan, exit non-zero on a hit
#   ./tools/check-public.sh --staged # scan only staged content
#
set -uo pipefail

STAGED=0
[ "${1:-}" = "--staged" ] && STAGED=1

if [ "$STAGED" -eq 1 ]; then
  FILES=$(git diff --cached --name-only --diff-filter=ACM)
else
  FILES=$(git ls-files)
fi

[ -z "$FILES" ] && { echo "check-public: nothing to scan"; exit 0; }

FAIL=0

# Files that describe the rules rather than violate them.
# .gitignore lists patterns in order to exclude them; README/index state the policy.
SKIP_LINES='no keys|no member|no commercial|no unpublished|nothing under NDA|unit economics, margins, CAC|keys, tokens, seed phrases|Commercial detail — unit economics|belongs in the \*\*private\*\* library|check it against'

scan() {
  local label="$1" pattern="$2"
  local hits
  hits=$(printf '%s\n' "$FILES" | while read -r f; do
      [ -f "$f" ] || continue
      # policy files describe the prohibitions rather than breach them
      if [ "$f" = "tools/check-public.sh" ] || [ "$f" = ".gitignore" ]; then continue; fi
      grep -InE "$pattern" "$f" 2>/dev/null \
        | grep -vE "$SKIP_LINES" \
        | sed "s|^|$f:|"
    done)
  if [ -n "$hits" ]; then
    echo "✗ $label"
    printf '%s\n' "$hits" | head -20 | sed 's/^/    /'
    FAIL=1
  fi
}

echo "check-public: scanning $(printf '%s\n' "$FILES" | wc -l | tr -d ' ') file(s)…"

# --- secrets -----------------------------------------------------------------
scan "API keys / tokens" \
  '(sk-[A-Za-z0-9]{16,}|sk-proj-[A-Za-z0-9_-]{16,}|gho_[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{30,}|xox[baprs]-[A-Za-z0-9-]{10,})'
scan "private key blocks / seed phrases" \
  '(-----BEGIN [A-Z ]*PRIVATE KEY-----|mnemonic|seed ?phrase|xprv[0-9A-Za-z]{50,}|[0-9a-fA-F]{64})'
scan "wallet key files" \
  '(keystore|wallet\.json|\.seed|\.keystore)'
scan "env files / credentials" \
  '(\.env|credentials\.json|service[_-]?account)'
scan "bearer / basic auth headers" \
  '(Authorization:[[:space:]]*(Bearer|Basic)[[:space:]]+[A-Za-z0-9._-]{12,})'

# --- infrastructure ----------------------------------------------------------
scan "private IP addresses" \
  '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})'

# --- personal data -----------------------------------------------------------
scan "member / customer data" \
  '(\b(member|customer|client)[_-]?id\b|passport|ID number|bank account|sort code|[0-9]{13}\b)'
scan "email addresses" \
  '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}'

# --- commercial detail (belongs in the private library) ---------------------
scan "commercial detail" \
  '(\bCAC\b|acquisition cost|gross margin|unit economics|\bCOGS\b|net margin|price ladder)'

# --- regulatory correspondence ----------------------------------------------
scan "regulator correspondence / unpublished filings" \
  '(unpublished|not for distribution|CONFIDENTIAL|INTERNAL ONLY|under NDA)'

# --- sanity ------------------------------------------------------------------
if ! grep -q "public" README.md 2>/dev/null; then
  echo "⚠ README.md does not state that this repository is public"
fi
if [ "$FAIL" -eq 0 ]; then
  echo "✓ check-public: clean"
else
  echo
  echo "check-public: FAILED — remove the material above, or move it to the private library."
fi
exit "$FAIL"
