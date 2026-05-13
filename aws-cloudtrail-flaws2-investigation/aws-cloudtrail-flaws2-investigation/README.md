\# AWS CloudTrail Investigation Lab - Flaws2



\## Overview

This project documents a hands-on AWS cloud security investigation using CloudTrail logs from the Flaws2 lab. The objective was to practice AWS CLI, AssumeRole, IAM policy review, jq log analysis, ECR policy inspection, and Athena SQL-based investigation.



\## Skills Practiced

\- AWS CLI configuration

\- S3 log download

\- Cross-account AssumeRole

\- IAM role trust policy analysis

\- CloudTrail log analysis

\- jq filtering

\- ECR repository policy review

\- Athena SQL investigation

\- Incident response timeline creation



\## Lab Environment

\- OS: Windows PowerShell

\- Tools: AWS CLI, jq, Athena, S3, IAM, ECR

\- Region: us-east-1

\- Dataset: Flaws2 CloudTrail logs



\## Objectives Completed



\### Objective 1: Download CloudTrail Logs

Summary:

Downloaded CloudTrail logs from the S3 bucket for local analysis.



Evidence:

\- Screenshot: screenshots/obj1-download-logs/

\- Commands: commands.md



\### Objective 2: Assume Target Role

Summary:

Configured AWS CLI profile to assume the target account role.



Key Finding:

The default profile operated in the security account, while target\_security operated in the target account as an assumed role.



\### Objective 3: Analyze Logs with jq

Summary:

Used jq to parse CloudTrail JSON logs and build a timeline of AWS API activity.



\### Objective 4: Identify Credential Theft

Summary:

Focused on ListBuckets and role usage to trace suspicious access.



\### Objective 5: Analyze ECR Repository Policy

Summary:

Reviewed ECR repository policy and identified public read permissions.



\### Objective 6: Query Logs with Athena

Summary:

Created an Athena external table over CloudTrail logs stored in S3 and queried events using SQL.



\## Key Findings

\- Anonymous S3 GetObject events were visible in CloudTrail.

\- AWSService events represented AWS services assuming roles.

\- The level1 role performed ECR-related actions.

\- The level3 assumed role performed ListBuckets.

\- Athena allowed SQL-based investigation without downloading logs.



\## Lessons Learned

\- CloudTrail is critical for AWS incident response.

\- AssumeRole is commonly used for cross-account access.

\- jq is useful for local JSON log analysis.

\- Athena is better for scalable log investigation.

\- IAM and resource policies must be reviewed carefully.



\## Cleanup

\- Dropped Athena table and database.

\- Removed Athena result bucket after practice.

\- Verified no secrets were committed.

