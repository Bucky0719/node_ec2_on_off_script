#!/bin/bash

AWS_REGION="us-east-1"  
INSTANCE_ID="i-0c1e67d0a65bee739"  

echo "Starting EC2 instance: $INSTANCE_ID..."
aws ec2 start-instances --instance-ids $INSTANCE_ID --region $AWS_REGION

echo "Waiting for the instance to start..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID --region $AWS_REGION

EC2_PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --region $AWS_REGION --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

echo "EC2_Public_IP: $EC2_PUBLIC_IP"
echo "##vso[task.setvariable variable=EC2_PUBLIC_IP;isOutput=true]$EC2_PUBLIC_IP"
