data "template_cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = true

  part{
      content = <<-EOT
      #!/bin/bash
      sudo yum update -y
      sudo yum install -y httpd
      sudo systemctl start httpd
      sudo systemctl enable httpd
      sudo wget https://github.com/kasvoy/AWS_Inf/archive/refs/heads/main.zip
      sudo unzip main.zip
      cd AWS_Inf-main
      sudo mv index.html /var/www/html/
      cd /var/www/html/
      sudo service httpd start
      
      EOT
  }
}