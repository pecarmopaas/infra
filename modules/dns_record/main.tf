resource "cloudflare_dns_record" "aks_wildcard" {
  zone_id = var.cloudflare_zone_id
  name    = var.dns_record_name
  proxied = var.dns_record_proxied
  content = var.dns_record_content
  type    = var.dns_record_type
  ttl     = var.dns_record_ttl
}
