#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/oss-cad-suite/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH:-}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PICOSOC_DIR="${SCRIPT_DIR}/picosoc"

cd "${PICOSOC_DIR}"
make clean
yosys -p 'read_verilog -I .. picosoc.v ../picorv32.v spimemio.v simpleuart.v; synth_ecp5 -top picosoc -json picosoc.json'
