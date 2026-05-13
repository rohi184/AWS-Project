CREATE DATABASE flaws2;

CREATE EXTERNAL TABLE `cloudtrail`(
    `eventversion` string,
    `useridentity` struct<type:string,principalid:string,arn:string,accountid:string,invokedby:string,accesskeyid:string,username:string,sessioncontext:struct<attributes:struct<mfaauthenticated:string,creationdate:string>,sessionissuer:struct<type:string,principalid:string,arn:string,accountid:string,username:string>>>,
    `eventtime` string,
    `eventsource` string,
    `eventname` string,
    `awsregion` string,
    `sourceipaddress` string,
    `useragent` string,
    `errorcode` string,
    `errormessage` string,
    `requestparameters` string,
    `responseelements` string,
    `additionaleventdata` string,
    `requestid` string,
    `eventid` string,
    `resources` array<struct<arn:string,accountid:string,type:string>>,
    `eventtype` string,
    `apiversion` string,
    `readonly` string,
    `recipientaccountid` string,
    `serviceeventdetails` string,
    `sharedeventid` string,
    `vpcendpointid` string
)
ROW FORMAT SERDE 
    'com.amazon.emr.hive.serde.CloudTrailSerde' 
STORED AS INPUTFORMAT 
    'com.amazon.emr.cloudtrail.CloudTrailInputFormat' 
OUTPUTFORMAT 
    'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
    's3://flaws2-logs/AWSLogs/653711331788/CloudTrail';

SELECT eventtime, eventname
FROM cloudtrail
ORDER BY eventtime;

SELECT 
    eventname,
    count(*) AS mycount 
FROM cloudtrail 
GROUP BY eventname 
ORDER BY mycount DESC;

SELECT 
  eventtime,
  eventname,
  sourceipaddress,
  useridentity.type,
  useridentity.arn,
  useragent
FROM cloudtrail
WHERE eventname = 'ListBuckets';

SELECT 
  eventtime,
  eventname,
  sourceipaddress,
  useridentity.type,
  useridentity.arn,
  requestparameters,
  useragent
FROM cloudtrail
WHERE eventsource = 'ecr.amazonaws.com'
ORDER BY eventtime;