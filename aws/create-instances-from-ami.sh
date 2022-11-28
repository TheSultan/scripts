# old hackathon fragment, may be useless
INSTNANCENAME = "Test"
AMI=ami-9173acf8
start=$(./ec2-run-instances $AMI -t m1.medium -g "Dev VMs" -d
    "c:\src\createUsers.vbs $username $password" )
INSTANCE=$(echo "$start" | awk '/^INSTANCE/ {print $2}')
./ec2-create-tags $AMI $INSTANCE -t Name=$username
