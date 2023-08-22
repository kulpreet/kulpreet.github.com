#!/bin/bash

/usr/local/bin/aws s3 sync _site/ s3://opdup.com/ --delete --exclude 'index.html' && /usr/local/bin/aws s3 sync _site/ s3://opdup.com/ --delete --exclude '*' --include 'index.html' --cache-control 'max-age=0'
