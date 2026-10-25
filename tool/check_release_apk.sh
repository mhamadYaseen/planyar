#!/usr/bin/env bash
# Checks a release APK before it goes on the phone (plan §9.2, §10.1, §11.8):
#   1. no INTERNET permission (the app must be provably offline);
#   2. native libraries aligned for 16 KB memory pages.
# Usage: tool/check_release_apk.sh build/app/outputs/flutter-apk/app-prod-release.apk
set -euo pipefail

apk="${1:?usage: $0 path/to/app-release.apk}"
sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
build_tools="$(ls -d "$sdk"/build-tools/* | sort -V | tail -1)"

echo "Checking $apk (build-tools $(basename "$build_tools"))"

permissions="$("$build_tools/aapt2" dump permissions "$apk")"
echo "$permissions" | sed 's/^/  /'
if echo "$permissions" | grep -q 'android.permission.INTERNET'; then
  echo "FAIL: release APK requests INTERNET" >&2
  exit 1
fi
echo "OK: no INTERNET permission"

if ! "$build_tools/zipalign" -c -P 16 4 "$apk"; then
  echo "FAIL: native libraries are not 16 KB aligned" >&2
  exit 1
fi
echo "OK: 16 KB aligned"
