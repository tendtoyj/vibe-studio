#!/bin/sh
# overview.html → overview-light.png / overview-dark.png (2x). 필요: Google Chrome, Pretendard 글꼴.
set -e
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
H=${H:-760}
for mode in light dark; do
  url="file://$PWD/overview.html"; [ "$mode" = dark ] && url="$url#dark"
  "$CHROME" --headless=new --hide-scrollbars --force-device-scale-factor=2 \
    --window-size=1040,$H --screenshot="$PWD/overview-$mode.png" "$url" >/dev/null 2>&1
done
echo "rendered overview-light.png overview-dark.png (1040x$H @2x)"
