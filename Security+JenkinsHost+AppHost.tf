module "Jenkins_Host_sg1" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "SSH to Private Host Jenkins and Application"
  description = "opening all ports"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      description = "All ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = [
 "all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_instance" "Jenkins_host" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.small"
  key_name      = "jen-key"
  subnet_id     = module.vpc.private_subnets[0]
  vpc_security_group_ids = [module.Jenkins_Host_sg1.security_group_id]


  tags = {
    Name = "Jenkins-Host"
  }

}
resource "aws_instance" "Application_host" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.small"
  key_name      = "jen-key"
  subnet_id     = module.vpc.private_subnets[1]
  vpc_security_group_ids = [module.Jenkins_Host_sg1.security_group_id]


  tags = {
    Name = "Application-Host"
  }

}
