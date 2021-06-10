variable sg {
  type        = list(number)
  default     = [80,443]
  description = "List of ports"
}

output "sgname" {
  value       = aws_security_group.SG_Web_server.name
  
}

resource "aws_security_group" "SG_Web_server" {
  name        = "SG_Web_ser"
  description = "Allow HTTP/HTTPS"
 

  dynamic "ingress" {
    iterator = port  
    for_each =  var.sg
    content{
    description      = "HTTP/HTTPS"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
}

  dynamic "egress" {
    iterator = port  
    for_each =  var.sg
    content{
    description      = "HTTP/HTTPS"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  }
 
}