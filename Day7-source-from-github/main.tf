module "test-module" {
  source = "github.com/sahilkhanpathan98/Terraformpractice/Day7-Module-source-directory"
  ami_id = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"
  key_name = "Revisionkeys"
}
