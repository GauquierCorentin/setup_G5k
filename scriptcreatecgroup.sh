#!/bin/bash

sudo-g5k cgcreate -g perf_event:222222

rq '$..URL' ../crossref/crossref/crossref8.json

pid=$!

sudo-g5k cgclassify -g perf_event:222222 $pid
