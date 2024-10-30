output "metabase_alb_sg_rule_ids" {
  value = data.aws_vpc_security_group_rules.metabase_alb_sg_rules.ids
}

output "metabase_ecs_sg_rule_ids" {
  value = data.aws_vpc_security_group_rules.metabase_ecs_sg_rules.ids
}
