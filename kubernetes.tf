locals {
  cluster_name                 = "demos3bucketnikhilsharmadev.k8s.local"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-ap-south-1a-masters-demos3bucketnikhilsharmadev-k8s-local.id]
  master_security_group_ids    = [aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id]
  masters_role_arn             = aws_iam_role.masters-demos3bucketnikhilsharmadev-k8s-local.arn
  masters_role_name            = aws_iam_role.masters-demos3bucketnikhilsharmadev-k8s-local.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
  node_security_group_ids      = [aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id]
  node_subnet_ids              = [aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
  nodes_role_arn               = aws_iam_role.nodes-demos3bucketnikhilsharmadev-k8s-local.arn
  nodes_role_name              = aws_iam_role.nodes-demos3bucketnikhilsharmadev-k8s-local.name
  region                       = "ap-south-1"
  route_table_public_id        = aws_route_table.demos3bucketnikhilsharmadev-k8s-local.id
  subnet_ap-south-1a_id        = aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id
  vpc_cidr_block               = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.cidr_block
  vpc_id                       = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

output "cluster_name" {
  value = "demos3bucketnikhilsharmadev.k8s.local"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-ap-south-1a-masters-demos3bucketnikhilsharmadev-k8s-local.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-demos3bucketnikhilsharmadev-k8s-local.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-demos3bucketnikhilsharmadev-k8s-local.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-demos3bucketnikhilsharmadev-k8s-local.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-demos3bucketnikhilsharmadev-k8s-local.name
}

output "region" {
  value = "ap-south-1"
}

output "route_table_public_id" {
  value = aws_route_table.demos3bucketnikhilsharmadev-k8s-local.id
}

output "subnet_ap-south-1a_id" {
  value = aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id
}

output "vpc_cidr_block" {
  value = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.cidr_block
}

output "vpc_id" {
  value = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_autoscaling_group" "master-ap-south-1a-masters-demos3bucketnikhilsharmadev-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-ap-south-1a-masters-demos3bucketnikhilsharmadev-k8s-local.id
    version = aws_launch_template.master-ap-south-1a-masters-demos3bucketnikhilsharmadev-k8s-local.latest_version
  }
  load_balancers        = [aws_elb.api-demos3bucketnikhilsharmadev-k8s-local.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "demos3bucketnikhilsharmadev.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local"
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
    key                 = "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-ap-south-1a-demos3bucketnikhilsharmadev-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id
    version = aws_launch_template.nodes-ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "demos3bucketnikhilsharmadev.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
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
    key                 = "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
}

resource "aws_ebs_volume" "a-etcd-events-demos3bucketnikhilsharmadev-k8s-local" {
  availability_zone = "ap-south-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "a.etcd-events.demos3bucketnikhilsharmadev.k8s.local"
    "k8s.io/etcd/events"                                          = "a/a"
    "k8s.io/role/master"                                          = "1"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-demos3bucketnikhilsharmadev-k8s-local" {
  availability_zone = "ap-south-1a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "a.etcd-main.demos3bucketnikhilsharmadev.k8s.local"
    "k8s.io/etcd/main"                                            = "a/a"
    "k8s.io/role/master"                                          = "1"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_elb" "api-demos3bucketnikhilsharmadev-k8s-local" {
  cross_zone_load_balancing = false
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "SSL:443"
    timeout             = 5
    unhealthy_threshold = 2
  }
  idle_timeout = 300
  listener {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }
  name            = "api-demos3bucketnikhilsha-pqt3vb"
  security_groups = [aws_security_group.api-elb-demos3bucketnikhilsharmadev-k8s-local.id]
  subnets         = [aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id]
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "api.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-demos3bucketnikhilsharmadev-k8s-local" {
  name = "masters.demos3bucketnikhilsharmadev.k8s.local"
  role = aws_iam_role.masters-demos3bucketnikhilsharmadev-k8s-local.name
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "masters.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-demos3bucketnikhilsharmadev-k8s-local" {
  name = "nodes.demos3bucketnikhilsharmadev.k8s.local"
  role = aws_iam_role.nodes-demos3bucketnikhilsharmadev-k8s-local.name
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "nodes.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_iam_role" "masters-demos3bucketnikhilsharmadev-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.demos3bucketnikhilsharmadev.k8s.local_policy")
  name               = "masters.demos3bucketnikhilsharmadev.k8s.local"
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "masters.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_iam_role" "nodes-demos3bucketnikhilsharmadev-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.demos3bucketnikhilsharmadev.k8s.local_policy")
  name               = "nodes.demos3bucketnikhilsharmadev.k8s.local"
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "nodes.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-demos3bucketnikhilsharmadev-k8s-local" {
  name   = "masters.demos3bucketnikhilsharmadev.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.demos3bucketnikhilsharmadev.k8s.local_policy")
  role   = aws_iam_role.masters-demos3bucketnikhilsharmadev-k8s-local.name
}

resource "aws_iam_role_policy" "nodes-demos3bucketnikhilsharmadev-k8s-local" {
  name   = "nodes.demos3bucketnikhilsharmadev.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.demos3bucketnikhilsharmadev.k8s.local_policy")
  role   = aws_iam_role.nodes-demos3bucketnikhilsharmadev-k8s-local.name
}

resource "aws_internet_gateway" "demos3bucketnikhilsharmadev-k8s-local" {
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_key_pair" "kubernetes-demos3bucketnikhilsharmadev-k8s-local-a43961d3814687039f1e3e8b518bc940" {
  key_name   = "kubernetes.demos3bucketnikhilsharmadev.k8s.local-a4:39:61:d3:81:46:87:03:9f:1e:3e:8b:51:8b:c9:40"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.demos3bucketnikhilsharmadev.k8s.local-a43961d3814687039f1e3e8b518bc940_public_key")
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_launch_template" "master-ap-south-1a-masters-demos3bucketnikhilsharmadev-k8s-local" {
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
    name = aws_iam_instance_profile.masters-demos3bucketnikhilsharmadev-k8s-local.id
  }
  image_id      = "ami-0d3312654dea937b7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-demos3bucketnikhilsharmadev-k8s-local-a43961d3814687039f1e3e8b518bc940.id
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
  name = "master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "demos3bucketnikhilsharmadev.k8s.local"
      "Name"                                                                                                  = "master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-ap-south-1a"
      "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"                                           = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "demos3bucketnikhilsharmadev.k8s.local"
      "Name"                                                                                                  = "master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-ap-south-1a"
      "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"                                           = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                                                                  = "master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-ap-south-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-ap-south-1a"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"                                           = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-ap-south-1a.masters.demos3bucketnikhilsharmadev.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-ap-south-1a-demos3bucketnikhilsharmadev-k8s-local" {
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
    name = aws_iam_instance_profile.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  }
  image_id      = "ami-0d3312654dea937b7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.kubernetes-demos3bucketnikhilsharmadev-k8s-local-a43961d3814687039f1e3e8b518bc940.id
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
  name = "nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "demos3bucketnikhilsharmadev.k8s.local"
      "Name"                                                                       = "nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1a"
      "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"                = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "demos3bucketnikhilsharmadev.k8s.local"
      "Name"                                                                       = "nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1a"
      "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"                = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                                       = "nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-ap-south-1a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-ap-south-1a"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local"                = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-ap-south-1a.demos3bucketnikhilsharmadev.k8s.local_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demos3bucketnikhilsharmadev-k8s-local.id
  route_table_id         = aws_route_table.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_route_table" "demos3bucketnikhilsharmadev-k8s-local" {
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
    "kubernetes.io/kops/role"                                     = "public"
  }
  vpc_id = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_route_table_association" "ap-south-1a-demos3bucketnikhilsharmadev-k8s-local" {
  route_table_id = aws_route_table.demos3bucketnikhilsharmadev-k8s-local.id
  subnet_id      = aws_subnet.ap-south-1a-demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_security_group" "api-elb-demos3bucketnikhilsharmadev-k8s-local" {
  description = "Security group for api ELB"
  name        = "api-elb.demos3bucketnikhilsharmadev.k8s.local"
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "api-elb.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_security_group" "masters-demos3bucketnikhilsharmadev-k8s-local" {
  description = "Security group for masters"
  name        = "masters.demos3bucketnikhilsharmadev.k8s.local"
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "masters.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_security_group" "nodes-demos3bucketnikhilsharmadev-k8s-local" {
  description = "Security group for nodes"
  name        = "nodes.demos3bucketnikhilsharmadev.k8s.local"
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "nodes.demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-demos3bucketnikhilsharmadev-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-demos3bucketnikhilsharmadev-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-api-elb-demos3bucketnikhilsharmadev-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-api-elb-demos3bucketnikhilsharmadev-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-demos3bucketnikhilsharmadev-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-demos3bucketnikhilsharmadev-k8s-local-ingress-all-0to0-masters-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-demos3bucketnikhilsharmadev-k8s-local-ingress-all-0to0-nodes-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-demos3bucketnikhilsharmadev-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-demos3bucketnikhilsharmadev-k8s-local-ingress-all-0to0-nodes-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-demos3bucketnikhilsharmadev-k8s-local-ingress-tcp-1to2379-masters-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-demos3bucketnikhilsharmadev-k8s-local-ingress-tcp-2382to4000-masters-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-demos3bucketnikhilsharmadev-k8s-local-ingress-tcp-4003to65535-masters-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-demos3bucketnikhilsharmadev-k8s-local-ingress-udp-1to65535-masters-demos3bucketnikhilsharmadev-k8s-local" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.nodes-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-demos3bucketnikhilsharmadev-k8s-local.id
  source_security_group_id = aws_security_group.api-elb-demos3bucketnikhilsharmadev-k8s-local.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.api-elb-demos3bucketnikhilsharmadev-k8s-local.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_subnet" "ap-south-1a-demos3bucketnikhilsharmadev-k8s-local" {
  availability_zone = "ap-south-1a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "ap-south-1a.demos3bucketnikhilsharmadev.k8s.local"
    "SubnetType"                                                  = "Public"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
    "kubernetes.io/role/elb"                                      = "1"
    "kubernetes.io/role/internal-elb"                             = "1"
  }
  vpc_id = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
}

resource "aws_vpc" "demos3bucketnikhilsharmadev-k8s-local" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "demos3bucketnikhilsharmadev-k8s-local" {
  domain_name         = "ap-south-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                                           = "demos3bucketnikhilsharmadev.k8s.local"
    "Name"                                                        = "demos3bucketnikhilsharmadev.k8s.local"
    "kubernetes.io/cluster/demos3bucketnikhilsharmadev.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "demos3bucketnikhilsharmadev-k8s-local" {
  dhcp_options_id = aws_vpc_dhcp_options.demos3bucketnikhilsharmadev-k8s-local.id
  vpc_id          = aws_vpc.demos3bucketnikhilsharmadev-k8s-local.id
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
