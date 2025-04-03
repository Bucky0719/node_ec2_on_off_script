#!/bin/bash

# Set your AWS region and EC2 instance ID
AWS_REGION="us-east-1"
INSTANCE_ID="i-0c1e67d0a65bee739"

# Stop the EC2 instance
echo "Stopping EC2 instance: $INSTANCE_ID..."
aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $AWS_REGION

# Wait for the instance to stop
echo "Waiting for the instance to stop..."
aws ec2 wait instance-stopped --instance-ids $INSTANCE_ID --region $AWS_REGION

echo "EC2 instance $INSTANCE_ID has been stopped."
