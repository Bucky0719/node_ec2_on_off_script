#!/bin/bash

echo "🔄 Starting EC2 instance: $INSTANCE_ID"

aws ec2 start-instances --instance-ids "$INSTANCE_ID" --region "$AWS_DEFAULT_REGION"
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID" --region "$AWS_DEFAULT_REGION"

echo "✅ EC2 instance started successfully."

