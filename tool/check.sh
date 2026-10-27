#!/usr/bin/env bash
# Everything CI's main job checks, locally: format, analyzer, tests.
# Usage: tool/check.sh [test paths…]
set -euo pipefail
cd "$(dirname "$0")/.."
tool/format.sh --check
flutter analyze --fatal-infos
flutter test "$@"
