#!/bin/bash
set -euo pipefail

REPO_DIR="terraform/repos/${REPO_NAME}"

mkdir -p "$REPO_DIR"

cat <<EOF > "$REPO_DIR/main.tf"
module "repo" {
  source              = "../../modules/repo"

  nome                = "${REPO_NAME}"
  branch_default      = "${BRANCH_DEFAULT}"
  protect_branch_rule = ${PROTECT_BRANCH_RULE}
  pr_merge_check      = ${PR_MERGE_CHECK}

  required_checks     = ${REQUIRED_CHECKS}
  repo_variables      = jsondecode('${REPO_VARIABLES_JSON}')
}
EOF

echo "Terraform configurado em $REPO_DIR/main.tf"
