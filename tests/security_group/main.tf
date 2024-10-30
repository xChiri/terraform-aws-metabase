data "aws_vpc_security_group_rules" "metabase_alb_sg_rules" {
  filter {
    name   = "group-id"
    values = [var.metabase_alb_sg_id]
  }
}

data "aws_vpc_security_group_rules" "metabase_ecs_sg_rules" {
  filter {
    name   = "group-id"
    values = [var.metabase_ecs_sg_id]
  }
}

data "aws_vpc_security_group_rules" "metabase_rds_sg_rules" {
  filter {
    name   = "group-id"
    values = [var.metabase_rds_sg_id]
  }
}

data "aws_vpc_security_group_rule" "metabase_alb_sg_rules" {
  for_each               = data.aws_vpc_security_group_rules.metabase_alb_sg_rules.ids
  security_group_rule_id = each.key
}

data "aws_vpc_security_group_rule" "metabase_ecs_sg_rules" {
  for_each               = data.aws_vpc_security_group_rules.metabase_ecs_sg_rules.ids
  security_group_rule_id = each.key
}

data "aws_vpc_security_group_rule" "metabase_rds_sg_rules" {
  for_each               = data.aws_vpc_security_group_rules.metabase_rds_sg_rules.ids
  security_group_rule_id = each.key
}
