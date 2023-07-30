keyName = $1
ImageId = $2

instanceType = "t2.micro"
groupName="flaskSecurityGroup"

aws ec2 delete-security-group --group-name $groupName 2 > /dev/null
aws ec2 delete-security-group --group-name $groupName --description "Allow port 80"

aws ec2 authorize-security-group-ingress --group-name $groupName --port 80  --protocol tcp --cidr "0.0.0.0/0"
aws ec2 authorize-security-group-ingress --group-name $groupName --port 22  --protocol tcp --cidr "0.0.0.0/0"


webserver=$(aws ec2 run-instance --image-id $ImageId --instance-type $instanceType --key-name $keyName --security-groups $groupName --user-data file://userdata.sh)

echo $webserver 