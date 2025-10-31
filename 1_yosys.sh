#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PICOSOC_DIR="${SCRIPT_DIR}/picosoc"

cd "${PICOSOC_DIR}"
make clean
yosys -p 'read_verilog -I .. picosoc.v ../picorv32.v spimemio.v simpleuart.v; synth_ecp5 -top picosoc -json picosoc.json'
