#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "${SCRIPT_DIR}"
make test TOOLCHAIN_PREFIX=riscv64-unknown-elf-
