#!/bin/bash

echo "Starting EC2 instance: $INSTANCE_ID"
aws ec2 start-instances --instance-ids "$INSTANCE_ID" --region "$AWS_DEFAULT_REGION"

echo "Waiting for instance to be in 'running' state..."
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID" --region "$AWS_DEFAULT_REGION"

PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --region "$AWS_DEFAULT_REGION" \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "Instance started with IP: $PUBLIC_IP"
echo "##vso[task.setvariable variable=EC2_PUBLIC_IP;isOutput=true]$PUBLIC_IP"

echo "✅ EC2 instance started successfully."

