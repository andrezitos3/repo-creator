output "repo_url" {
  value = github_repository.this.html_url
}

output "repo_id" {
  value = github_repository.this.node_id
}
