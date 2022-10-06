resource "aws_route_table" "main" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = lower("${var.vpc.name}-rt")
  }
}

resource "aws_main_route_table_association" "default" {
  vpc_id         = aws_vpc.default.id
  route_table_id = aws_route_table.main.id
}
