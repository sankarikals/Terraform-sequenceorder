# Terraform-sequenceorder
create 4 different servers in sequence
Terraform Project
│
├── modules/
│   └── ec2/
│       ├── main.tf
│       ├── sg.tf
│       └── userdata.tpl
│
└── environments/dev/
    ├── server1.tf
    ├── server2.tf
    ├── server3.tf
    ├── server4.tf
