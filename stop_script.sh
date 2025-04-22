#!/bin/bash

echo "🔻 Stopping EC2 instance: $INSTANCE_ID"

aws ec2 stop-instances --instance-ids "$INSTANCE_ID" --region "$AWS_DEFAULT_REGION"
aws ec2 wait instance-stopped --instance-ids "$INSTANCE_ID" --region "$AWS_DEFAULT_REGION"

echo "✅ EC2 instance stopped successfully."

