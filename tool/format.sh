#!/usr/bin/env bash
# Formats hand-written Dart only; generated files are left exactly as their
# generators wrote them, so "regenerate and diff" stays meaningful.
# Usage: tool/format.sh            (format)
#        tool/format.sh --check    (CI: fail if anything would change)
set -euo pipefail
cd "$(dirname "$0")/.."
args=()
[[ "${1:-}" == "--check" ]] && args+=(--set-exit-if-changed --output=none)
find lib test -name '*.dart' \
  ! -name '*.g.dart' ! -name '*.freezed.dart' \
  ! -path '*/l10n/generated/*' ! -path '*/migrations/generated/*' -print0 |
  xargs -0 dart format ${args[@]+"${args[@]}"}
