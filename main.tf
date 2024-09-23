# Define the provider
provider "aws" {
  region = "ap-south-1"  # Change to your preferred region
}
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0522ab6e1ddcc7055"  # Replace with your desired AMI ID
  instance_type = "t2.micro"      # Change to your desired instance type

  key_name      = "jenkins-keypair"  # Replace with your key pair name
  tags = {
    Name = "MyEC2Instance"
  }
}



