
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
      echo "<h1>I love Badria, she's the cutest kitten!</h1>" | sudo tee /var/www/html/index.html
      sudo service httpd start

      EOT
  }
}