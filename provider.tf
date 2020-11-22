provider "aws"{
    region = "us-west-2"
    version = "2.70.0"
}

provider "aws"{
    region ="us-east-1"
    alias = "east"
    version = "2.70.0"
}
