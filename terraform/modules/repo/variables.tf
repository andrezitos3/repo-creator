variable "nome" {
  type        = string
  description = "Nome do repositório"
}

variable "branch_default" {
  type        = string
  description = "Branch padrão (main/master)"
  default     = "main"
}

variable "protect_branch_rule" {
  type        = bool
  description = "Se true, protege a branch default"
  default     = false
}

variable "pr_merge_check" {
  type        = bool
  description = "Se true, aplica merge check (status checks obrigatórios)"
  default     = false
}

variable "repo_variables" {
  type        = map(string)
  description = "Variáveis de ambiente do repositório (key/value)"
  default     = {}
}

variable "required_checks" {
  type        = list(string)
  description = "Lista de checks obrigatórios para o merge"
  default     = []
}
