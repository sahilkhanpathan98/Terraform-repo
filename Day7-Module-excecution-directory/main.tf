module "test-module" {
  source = "../Day7-Module-source-directory"
  ami_id = "ami-05fa46471b02db0ce"
  instance_type = "t2.micro"
  key_name = "Revisionkeys"
}

# agar yaha pr koi resource me add karta hu aur usse me Hardcode karta hu uski values
# then wo resource bhi create honga module ke sath
# and agar koi source me reource added hai aur uski value hardcoded hai then wo resource bhi create honga