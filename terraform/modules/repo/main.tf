terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

# Criação do repositório
resource "github_repository" "this" {
  name            = var.nome
  visibility      = "private"
  auto_init       = true
  has_issues      = true
  has_projects    = true
  has_wiki        = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true

  # Branch default
  default_branch  = var.branch_default
}

# Proteção da branch default (se ativado)
resource "github_branch_protection" "default" {
  count = var.protect_branch_rule ? 1 : 0

  repository_id  = github_repository.this.node_id
  pattern        = var.branch_default
  enforce_admins = true

  required_status_checks {
    strict   = var.pr_merge_check
    contexts = var.pr_merge_check ? var.required_checks : []
  }
}


# Variáveis de ambiente do repo
resource "github_actions_variable" "repo_vars" {
  for_each = var.repo_variables

  repository    = github_repository.this.name
  variable_name = each.key
  value         = each.value
}
