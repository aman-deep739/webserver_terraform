

resource "aws_eip" "elasticeip" {
        instance = var.id
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}