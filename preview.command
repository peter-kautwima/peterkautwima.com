#!/bin/sh
# Double-click this file to preview the site locally.
#
# Why this exists: links to case studies point at folders (e.g. work/evolving-climbers/)
# so the public URLs stay clean. Resolving a folder to its index.html is something a
# WEB SERVER does — opening index.html straight from disk has no server, so those links
# land on a folder listing instead of the page. This starts a tiny local server so the
# site behaves exactly as it does on peterkautwima.com.
#
# Close this Terminal window (or press Ctrl-C) to stop it.

cd "$(dirname "$0")" || exit 1

PORT=8000
while lsof -i ":$PORT" >/dev/null 2>&1; do
  PORT=$((PORT + 1))
  [ "$PORT" -gt 8020 ] && { echo "No free port between 8000-8020."; read -r _; exit 1; }
done

URL="http://localhost:$PORT"
printf '\n  peterkautwima.com — local preview\n'
printf '  %s\n\n' "$URL"
printf '  Serving: %s\n' "$(pwd)"
printf '  Stop with Ctrl-C or by closing this window.\n\n'

( sleep 1; open "$URL" >/dev/null 2>&1 ) &
exec python3 -m http.server "$PORT"
