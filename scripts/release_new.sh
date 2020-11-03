#!/usr/bin/env bash

set -e

if ! [[ "$0" =~ scripts/release_new.sh ]]; then
  echo "must be run from repository root"
  exit 255
fi

source ./scripts/test_lib.sh

function update_module_version {
   local v3version="v3.5.0-pre"
   local v2version="v2.305.0-pre"

   v3deps=$(run go list -f '{{if not .Main}}{{if not .Indirect}}{{.Path}}{{end}}{{end}}' -m all | grep -E 'github.com/ptabor/etcd/.*/v3')
   for dep in ${v3deps}; do
     run go mod edit -require "${dep}@${v3version}"
   done

   v2deps=$(run go list -f '{{if not .Main}}{{if not .Indirect}}{{.Path}}{{end}}{{end}}' -m all | grep -E 'github.com/ptabor/etcd/.*/v2')
   for dep in ${v2deps}; do
     run go mod edit -require "${dep}@${v2version}"
   done

}

function update_modules_versions() {
  run_for_modules update_module_version
}

update_modules_versions