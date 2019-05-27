resource "aws_security_group" "ec2-instance-sg" {
  name = "${var.ec2_instance_name}"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0d5a12b60df145121"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "ec2_instance" {
  ami = "ami-0e027dec10c160fa8"
  vpc_security_group_ids = ["${aws_security_group.ec2-instance-sg.id}"]
  subnet_id = "subnet-0f858ad2f7df41c20" 
  instance_type = "t2.micro"
  key_name = "dempa-ops"
  user_data = "${file("${path.module}/userdata.sh")}" 
tags = {
  Name = "${var.ec2_instance_name}"
  
  }
}
