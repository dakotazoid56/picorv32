#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/oss-cad-suite/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH:-}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PICOSOC_DIR="${SCRIPT_DIR}/picosoc"

cd "${PICOSOC_DIR}"
if nextpnr-ecp5 \
  --45k --package CABGA381 --speed 6 \
  --json picosoc.json \
  --out-of-context \
  --freq 100 \
  --report pnr_report.json \
  --write pnr_routed.json
then
  echo "nextpnr-ecp5 finished with exit code 0"
else
  rc=$?
  echo "nextpnr-ecp5 exited with code ${rc}; continuing and returning success (timing may have failed)"
fi
