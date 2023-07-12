This is an infrastructure for a highly available website on AWS. Users can go to the website following the DNS name of a Load Balancer that distributes traffic over EC2 instances. The DNS name is output after applying the infrastructure.


To use this infrastructure run:

```terraform apply -var-file "variables.tfvars"```

Requirements: Terraform
