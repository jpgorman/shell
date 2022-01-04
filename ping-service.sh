#!/bin/bash
set -euo pipefail

ping_service() {
  set +e
  CMD=$(nc -z localhost 8081 > /dev/null 2>&1)
  RC=( "${PIPESTATUS[@]}" )
  echo "${RC[0]}"
  if [ "${RC[0]}" -eq "0" ]; then 
    echo "We're good"
  else
    echo "Nope!"
  fi
}

ping_service
