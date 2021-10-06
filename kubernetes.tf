locals {
  cluster_name                 = "nikhilsharmadev.click"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-ap-south-1a-masters-nikhilsharmadev-click.id]
  master_security_group_ids    = [aws_security_group.masters-nikhilsharmadev-click.id]
  masters_role_arn             = aws_iam_role.masters-nikhilsharmadev-click.arn
  masters_role_name            = aws_iam_role.masters-nikhilsharmadev-click.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-ap-south-1a-nikhilsharmadev-click.id, aws_autoscaling_group.nodes-ap-south-1b-nikhilsharmadev-click.id]
  node_security_group_ids      = [aws_security_group.nodes-nikhilsharmadev-click.id]
  node_subnet_ids              = [aws_subnet.ap-south-1a-nikhilsharmadev-click.id, aws_subnet.ap-south-1b-nikhilsharmadev-click.id]
  nodes_role_arn               = aws_iam_role.nodes-nikhilsharmadev-click.arn
  nodes_role_name              = aws_iam_role.nodes-nikhilsharmadev-click.name
  region                       = "ap-south-1"
  route_table_public_id        = aws_route_table.nikhilsharmadev-click.id
  subnet_ap-south-1a_id        = aws_subnet.ap-south-1a-nikhilsharmadev-click.id
  subnet_ap-south-1b_id        = aws_subnet.ap-south-1b-nikhilsharmadev-click.id
  vpc_cidr_block               = aws_vpc.nikhilsharmadev-click.cidr_block
  vpc_id                       = aws_vpc.nikhilsharmadev-click.id
}

output "cluster_name" {
  value = "nikhilsharmadev.click"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-ap-south-1a-masters-nikhilsharmadev-click.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-nikhilsharmadev-click.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-nikhilsharmadev-click.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-nikhilsharmadev-click.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-ap-south-1a-nikhilsharmadev-click.id, aws_autoscaling_group.nodes-ap-south-1b-nikhilsharmadev-click.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-nikhilsharmadev-click.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.ap-south-1a-nikhilsharmadev-click.id, aws_subnet.ap-south-1b-nikhilsharmadev-click.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-nikhilsharmadev-click.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-nikhilsharmadev-click.name
}

output "region" {
  value = "ap-south-1"
}

output "route_table_public_id" {
  value = aws_route_table.nikhilsharmadev-click.id
}

output "subnet_ap-south-1a_id" {
  value = aws_subnet.ap-south-1a-nikhilsharmadev-click.id
}

output "subnet_ap-south-1b_id" {
  value = aws_subnet.ap-south-1b-nikhilsharmadev-click.id
}

output "vpc_cidr_block" {
  value = aws_vpc.nikhilsharmadev-click.cidr_block
}

output "vpc_id" {
  value = aws_vpc.nikhilsharmadev-click.id
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_autoscaling_group" "master-ap-south-1a-masters-nikhilsharmadev-click" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-ap-south-1a-masters-nikhilsharmadev-click.id
    version = aws_launch_template.master-ap-south-1a-masters-nikhilsharmadev-click.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-ap-south-1a.masters.nikhilsharmadev.click"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "nikhilsharmadev.click"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-ap-south-1a.masters.nikhilsharmadev.click"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-ap-south-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-ap-south-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/nikhilsharmadev.click"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1a-nikhilsharmadev-click.id]
}

resource "aws_autoscaling_group" "nodes-ap-south-1a-nikhilsharmadev-click" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-ap-south-1a-nikhilsharmadev-click.id
    version = aws_launch_template.nodes-ap-south-1a-nikhilsharmadev-click.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-ap-south-1a.nikhilsharmadev.click"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "nikhilsharmadev.click"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-ap-south-1a.nikhilsharmadev.click"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-south-1a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-south-1a"
  }
  tag {
    key                 = "kubernetes.io/cluster/nikhilsharmadev.click"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1a-nikhilsharmadev-click.id]
}

resource "aws_autoscaling_group" "nodes-ap-south-1b-nikhilsharmadev-click" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-ap-south-1b-nikhilsharmadev-click.id
    version = aws_launch_template.nodes-ap-south-1b-nikhilsharmadev-click.latest_version
  }
  max_size              = 0
  metrics_granularity   = "1Minute"
  min_size              = 0
  name                  = "nodes-ap-south-1b.nikhilsharmadev.click"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "nikhilsharmadev.click"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-ap-south-1b.nikhilsharmadev.click"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-south-1b"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-ap-south-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/nikhilsharmadev.click"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1b-nikhilsharmadev-click.id]
}

resource "aws_ebs_volume" "a-etcd-events-nikhilsharmadev-click" {
  availability_zone = "ap-south-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "a.etcd-events.nikhilsharmadev.click"
    "k8s.io/etcd/events"                          = "a/a"
    "k8s.io/role/master"                          = "1"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-nikhilsharmadev-click" {
  availability_zone = "ap-south-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "a.etcd-main.nikhilsharmadev.click"
    "k8s.io/etcd/main"                            = "a/a"
    "k8s.io/role/master"                          = "1"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_iam_instance_profile" "masters-nikhilsharmadev-click" {
  name = "masters.nikhilsharmadev.click"
  role = aws_iam_role.masters-nikhilsharmadev-click.name
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "masters.nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-nikhilsharmadev-click" {
  name = "nodes.nikhilsharmadev.click"
  role = aws_iam_role.nodes-nikhilsharmadev-click.name
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nodes.nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_iam_role" "masters-nikhilsharmadev-click" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.nikhilsharmadev.click_policy")
  name               = "masters.nikhilsharmadev.click"
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "masters.nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_iam_role" "nodes-nikhilsharmadev-click" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.nikhilsharmadev.click_policy")
  name               = "nodes.nikhilsharmadev.click"
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nodes.nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-nikhilsharmadev-click" {
  name   = "masters.nikhilsharmadev.click"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.nikhilsharmadev.click_policy")
  role   = aws_iam_role.masters-nikhilsharmadev-click.name
}

resource "aws_iam_role_policy" "nodes-nikhilsharmadev-click" {
  name   = "nodes.nikhilsharmadev.click"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.nikhilsharmadev.click_policy")
  role   = aws_iam_role.nodes-nikhilsharmadev-click.name
}

resource "aws_internet_gateway" "nikhilsharmadev-click" {
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
  vpc_id = aws_vpc.nikhilsharmadev-click.id
}

resource "aws_key_pair" "kubernetes-nikhilsharmadev-click-a43961d3814687039f1e3e8b518bc940" {
  key_name   = "kubernetes.nikhilsharmadev.click-a4:39:61:d3:81:46:87:03:9f:1e:3e:8b:51:8b:c9:40"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.nikhilsharmadev.click-a43961d3814687039f1e3e8b518bc940_public_key")
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_launch_template" "master-ap-south-1a-masters-nikhilsharmadev-click" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-nikhilsharmadev-click.id
  }
  image_id      = "ami-0d3312654dea937b7"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-nikhilsharmadev-click-a43961d3814687039f1e3e8b518bc940.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "master-ap-south-1a.masters.nikhilsharmadev.click"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-nikhilsharmadev-click.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "nikhilsharmadev.click"
      "Name"                                                                                                  = "master-ap-south-1a.masters.nikhilsharmadev.click"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-ap-south-1a"
      "kubernetes.io/cluster/nikhilsharmadev.click"                                                           = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "nikhilsharmadev.click"
      "Name"                                                                                                  = "master-ap-south-1a.masters.nikhilsharmadev.click"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-ap-south-1a"
      "kubernetes.io/cluster/nikhilsharmadev.click"                                                           = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "nikhilsharmadev.click"
    "Name"                                                                                                  = "master-ap-south-1a.masters.nikhilsharmadev.click"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-south-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-ap-south-1a"
    "kubernetes.io/cluster/nikhilsharmadev.click"                                                           = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-ap-south-1a.masters.nikhilsharmadev.click_user_data")
}

resource "aws_launch_template" "nodes-ap-south-1a-nikhilsharmadev-click" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-nikhilsharmadev-click.id
  }
  image_id      = "ami-0d3312654dea937b7"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-nikhilsharmadev-click-a43961d3814687039f1e3e8b518bc940.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-ap-south-1a.nikhilsharmadev.click"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-nikhilsharmadev-click.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "nikhilsharmadev.click"
      "Name"                                                                       = "nodes-ap-south-1a.nikhilsharmadev.click"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1a"
      "kubernetes.io/cluster/nikhilsharmadev.click"                                = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "nikhilsharmadev.click"
      "Name"                                                                       = "nodes-ap-south-1a.nikhilsharmadev.click"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1a"
      "kubernetes.io/cluster/nikhilsharmadev.click"                                = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "nikhilsharmadev.click"
    "Name"                                                                       = "nodes-ap-south-1a.nikhilsharmadev.click"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1a"
    "kubernetes.io/cluster/nikhilsharmadev.click"                                = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-ap-south-1a.nikhilsharmadev.click_user_data")
}

resource "aws_launch_template" "nodes-ap-south-1b-nikhilsharmadev-click" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-nikhilsharmadev-click.id
  }
  image_id      = "ami-0d3312654dea937b7"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.kubernetes-nikhilsharmadev-click-a43961d3814687039f1e3e8b518bc940.id
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-ap-south-1b.nikhilsharmadev.click"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-nikhilsharmadev-click.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "nikhilsharmadev.click"
      "Name"                                                                       = "nodes-ap-south-1b.nikhilsharmadev.click"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1b"
      "kubernetes.io/cluster/nikhilsharmadev.click"                                = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "nikhilsharmadev.click"
      "Name"                                                                       = "nodes-ap-south-1b.nikhilsharmadev.click"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1b"
      "kubernetes.io/cluster/nikhilsharmadev.click"                                = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "nikhilsharmadev.click"
    "Name"                                                                       = "nodes-ap-south-1b.nikhilsharmadev.click"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1b"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1b"
    "kubernetes.io/cluster/nikhilsharmadev.click"                                = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-ap-south-1b.nikhilsharmadev.click_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.nikhilsharmadev-click.id
  route_table_id         = aws_route_table.nikhilsharmadev-click.id
}

resource "aws_route_table" "nikhilsharmadev-click" {
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
    "kubernetes.io/kops/role"                     = "public"
  }
  vpc_id = aws_vpc.nikhilsharmadev-click.id
}

resource "aws_route_table_association" "ap-south-1a-nikhilsharmadev-click" {
  route_table_id = aws_route_table.nikhilsharmadev-click.id
  subnet_id      = aws_subnet.ap-south-1a-nikhilsharmadev-click.id
}

resource "aws_route_table_association" "ap-south-1b-nikhilsharmadev-click" {
  route_table_id = aws_route_table.nikhilsharmadev-click.id
  subnet_id      = aws_subnet.ap-south-1b-nikhilsharmadev-click.id
}

resource "aws_security_group" "masters-nikhilsharmadev-click" {
  description = "Security group for masters"
  name        = "masters.nikhilsharmadev.click"
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "masters.nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
  vpc_id = aws_vpc.nikhilsharmadev-click.id
}

resource "aws_security_group" "nodes-nikhilsharmadev-click" {
  description = "Security group for nodes"
  name        = "nodes.nikhilsharmadev.click"
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nodes.nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
  vpc_id = aws_vpc.nikhilsharmadev-click.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-nikhilsharmadev-click" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-nikhilsharmadev-click.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-nikhilsharmadev-click" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-masters-nikhilsharmadev-click" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-nikhilsharmadev-click.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-masters-nikhilsharmadev-click-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-nikhilsharmadev-click.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-nikhilsharmadev-click-ingress-all-0to0-masters-nikhilsharmadev-click" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.masters-nikhilsharmadev-click.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-nikhilsharmadev-click-ingress-all-0to0-nodes-nikhilsharmadev-click" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.masters-nikhilsharmadev-click.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nikhilsharmadev-click-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-nikhilsharmadev-click-ingress-all-0to0-nodes-nikhilsharmadev-click" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nikhilsharmadev-click-ingress-tcp-1to2379-masters-nikhilsharmadev-click" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nikhilsharmadev-click-ingress-tcp-2382to4000-masters-nikhilsharmadev-click" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nikhilsharmadev-click-ingress-tcp-4003to65535-masters-nikhilsharmadev-click" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-nikhilsharmadev-click-ingress-udp-1to65535-masters-nikhilsharmadev-click" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-nikhilsharmadev-click.id
  source_security_group_id = aws_security_group.nodes-nikhilsharmadev-click.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_subnet" "ap-south-1a-nikhilsharmadev-click" {
  availability_zone = "ap-south-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "ap-south-1a.nikhilsharmadev.click"
    "SubnetType"                                  = "Public"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/role/internal-elb"             = "1"
  }
  vpc_id = aws_vpc.nikhilsharmadev-click.id
}

resource "aws_subnet" "ap-south-1b-nikhilsharmadev-click" {
  availability_zone = "ap-south-1b"
  cidr_block        = "172.20.64.0/19"
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "ap-south-1b.nikhilsharmadev.click"
    "SubnetType"                                  = "Public"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/role/internal-elb"             = "1"
  }
  vpc_id = aws_vpc.nikhilsharmadev-click.id
}

resource "aws_vpc" "nikhilsharmadev-click" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "nikhilsharmadev-click" {
  domain_name         = "ap-south-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                           = "nikhilsharmadev.click"
    "Name"                                        = "nikhilsharmadev.click"
    "kubernetes.io/cluster/nikhilsharmadev.click" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "nikhilsharmadev-click" {
  dhcp_options_id = aws_vpc_dhcp_options.nikhilsharmadev-click.id
  vpc_id          = aws_vpc.nikhilsharmadev-click.id
}

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    aws = {
      "source"  = "hashicorp/aws"
      "version" = ">= 3.34.0"
    }
  }
}
