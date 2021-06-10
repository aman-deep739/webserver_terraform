provider "aws" {
  region = "ap-south-1"
}


module "webserver_create" {
  source       = "./web"
  amiid        = "ami-0ad704c126371a549"
  instancetype = "t2.micro"
}



