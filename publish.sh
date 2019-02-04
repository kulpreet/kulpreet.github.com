#!/bin/bash

aws s3 sync _site/ s3://opdup.com/ --delete --exclude 'index.html' && aws s3 sync _site/ s3://opdup.com/ --delete --exclude '*' --include 'index.html' --cache-control 'max-age=0'
