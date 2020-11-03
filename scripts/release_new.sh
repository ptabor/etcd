#!/usr/bin/env bash

set -e

DRY_RUN=true

if ! [[ "$0" =~ scripts/release_new.sh ]]; then
  echo "must be run from repository root"
  exit 255
fi

source ./scripts/test_lib.sh

function update_module_version() {
  local v3version="v3.5.0-alpha.0"
  local v2version="v2.305.0-alpha.0"

  v3deps=$(run go list -f '{{if not .Main}}{{if not .Indirect}}{{.Path}}{{end}}{{end}}' -m all | grep -E 'github.com/ptabor/etcd/.*/v3')
  for dep in ${v3deps}; do
    run go mod edit -require "${dep}@${v3version}"
  done

  v2deps=$(run go list -f '{{if not .Main}}{{if not .Indirect}}{{.Path}}{{end}}{{end}}' -m all | grep -E 'github.com/ptabor/etcd/.*/v2')
  for dep in ${v2deps}; do
    run go mod edit -require "${dep}@${v2version}"
  done
}

function git_tag_module() {
  subdir=$(module_subdir)
  local tag
  if [ -z "${subdir}" ]; then
    tag="v3.5.0-alpha.0"
  else
    tag="${subdir}/v3.5.0-alpha.0"
  fi
  maybe_run git tag "${tag}"
}

function update_modules_versions() {
  run_for_modules update_module_version
}

function maybe_run() {
  if "${DRY_RUN}"; then
    log_cmd -e "DRY_RUN:\n  % ${*}"
  else
    run "${@}"
  fi
}

function push_mod_tags_cmd {
  run_for_modules git_tag_module
  maybe_run git push ${REMOTE_BRANCH} $(git tag --points-at HEAD | xargs)
}

update_modules_versions

#push_mod_tags_cmd
