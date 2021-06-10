resource "aws_instance" "webserver" {
  ami           = var.amiid
  instance_type = var.instancetype
  security_groups = [module.sg.sgname]
  user_data = file("./web/server-script.sh")  
  tags = {
    Name = "Webserver Server created from module"
  }
}




module "eip" {
  source       = "../eip"
  id = aws_instance.webserver.id
}

module "sg" {
  source       = "../sg"
 
}