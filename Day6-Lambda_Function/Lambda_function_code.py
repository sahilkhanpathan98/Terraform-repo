import json
import boto3

def lambda_handler(event, context):
  client = boto3.client('ec2')
  response = client.run_instances(
    ImageId='ami-05fa46471b02db0ce',
    InstanceType='t2.micro',
    KeyName='Revisionkeys',
    MaxCount=1,
    MinCount=1
)