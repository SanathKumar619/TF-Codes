
module "sg" {
  source = "../sg"
}

module "ec2" {
  source = "../ec2"
sg = [module.sg.sg_id]
}
