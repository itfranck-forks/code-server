#!/usr/bin/env bash
set -euo pipefail

main() {
  cd "$(dirname "$0")/../.."

  yarn --frozen-lockfile

  git submodule update --init
  # We do not `yarn vscode` to make test.sh faster.
  # If the patch fails to apply, then it's likely already applied
  yarn vscode:patch &> /dev/null || true

  yarn test
}

main "$@"
