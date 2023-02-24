resource "aws_launch_template" "WebsiteTemplate" {
  name = "WebLT"
  key_name = "ProjInstance"

  instance_type = "t2.micro"

  image_id = "ami-0aa7d40eeae50c9a9"
  
  tags = {
    name = "Website launch template"
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.asg_sg.id]
  }

  user_data = data.template_cloudinit_config.user_data.rendered
}