#!/bin/bash

#--packages com.amazonaws:aws-java-sdk:1.7.4,org.apache.hadoop:hadoop-aws:2.7.1 \
#--packages com.amazonaws:aws-java-sdk:1.12.31,org.apache.hadoop:hadoop-aws:3.1.2 \
pyspark \
--packages software.amazon.awssdk:s3:2.17.52,org.apache.hadoop:hadoop-aws:3.1.2 \
\
--conf spark.hadoop.dfs.permissions.enable=false \
\
--conf spark.hadoop.fs.s3.endpoint=http://localstack:4566 \
--conf spark.hadoop.fs.s3.impl=org.apache.hadoop.fs.s3native.NativeS3FileSystem \
--conf spark.hadoop.fs.s3.access.key=test \
--conf spark.hadoop.fs.s3.secret.key=test \
--conf spark.hadoop.fs.s3.path.style.access=true \
\
--conf spark.hadoop.fs.s3a.endpoint=http://localstack:4566 \
--conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
--conf spark.hadoop.fs.s3a.access.key=test \
--conf spark.hadoop.fs.s3a.secret.key=test \
--conf spark.hadoop.fs.s3a.path.style.access=true \
\
--conf spark.ui.showConsoleProgress=false
