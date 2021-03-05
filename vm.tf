resource "aws_instance" "myFirstInstance" {
  ami             = var.amii
  instance_type   = var.instancetype
  security_groups = ["security_jenkins_port2"]
  tags = {
    Name = "jenkins_instance"
  }
}
#Create security group with firewall rules
resource "aws_security_group" "security_jenkins_port2" {
  name        = "security_jenkins_port2"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_jenkins_port"
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  vpc      = true
  instance = aws_instance.myFirstInstance.id
  tags = {
    Name = "jenkins_elstic_ip"
  }
}