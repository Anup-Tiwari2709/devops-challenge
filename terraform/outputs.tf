output "namespace_name" {
  value = kubernetes_namespace.devops_challenge.metadata[0].name
}

output "resource_quota_name" {
  value = kubernetes_resource_quota.memory_quota.metadata[0].name
}
