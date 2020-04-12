output "k8s_api_http_security_group_id" {
  value = aws_security_group.k8s_api_http.id
}

output "kops_s3_bucket_name" {
  value = aws_s3_bucket.kops_state.bucket
}

