aws_key="mitchell-eu-west-1"
aws_arm_ami="ami-08f2ca0755caafc54"
aws_amd64_ami="ami-0be7b168330326655"
aws_placement_group="nginx_atomics"
aws_sg="sg-01e577130c6dd5af9"
aws_region="eu-west-1"

# SUT
aws ec2 run-instances \
    --image-id "$aws_arm_ami" \
    --count 1 \
    --instance-type a1.metal \
    --key-name "$aws_key" \
    --placement GroupName="$aws_placement_group" \
    --security-group-ids "$aws_sg" \
    --region "$aws_region" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mitchdz-nginx-SUT}]' \
    --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":24,"VolumeType":"gp2"}}]'

# DRV
aws ec2 run-instances \
    --image-id "$aws_amd64_ami" \
    --count 1 \
    --instance-type c5.9xlarge \
    --key-name "$aws_key" \
    --placement GroupName="$aws_placement_group" \
    --security-group-ids "$aws_sg" \
    --region "$aws_region" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mitchdz-nginx-DRV}]' \
    --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":24,"VolumeType":"gp2"}}]'

# endpoints
aws ec2 run-instances \
    --image-id "$aws_amd64_ami" \
    --count 1 \
    --instance-type c5.4xlarge \
    --key-name "$aws_key" \
    --placement GroupName="$aws_placement_group" \
    --security-group-ids "$aws_sg" \
    --region "$aws_region" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mitchdz-nginx-endpoint1}]' \
    --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":24,"VolumeType":"gp2"}}]'

aws ec2 run-instances \
    --image-id "$aws_amd64_ami" \
    --count 1 \
    --instance-type c5.4xlarge \
    --key-name "$aws_key" \
    --placement GroupName="$aws_placement_group" \
    --security-group-ids "$aws_sg" \
    --region "$aws_region" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mitchdz-nginx-endpoint2}]' \
    --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":24,"VolumeType":"gp2"}}]'

aws ec2 run-instances \
    --image-id "$aws_amd64_ami" \
    --count 1 \
    --instance-type c5.4xlarge \
    --key-name "$aws_key" \
    --placement GroupName="$aws_placement_group" \
    --security-group-ids "$aws_sg" \
    --region "$aws_region" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mitchdz-nginx-endpoint3}]' \
    --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":24,"VolumeType":"gp2"}}]'

aws ec2 run-instances \
    --image-id "$aws_amd64_ami" \
    --count 1 \
    --instance-type c5.4xlarge \
    --key-name "$aws_key" \
    --placement GroupName="$aws_placement_group" \
    --security-group-ids "$aws_sg" \
    --region "$aws_region" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mitchdz-nginx-endpoint4}]' \
    --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":24,"VolumeType":"gp2"}}]'
