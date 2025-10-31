#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/oss-cad-suite/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH:-}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "${SCRIPT_DIR}"
make clean
make test TOOLCHAIN_PREFIX=riscv64-unknown-elf-
