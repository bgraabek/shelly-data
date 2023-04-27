#!/bin/sh

# Shell script to pull data from shelly devices (https://www.shelly.cloud) and send to Falcon LogScale HEC endpoint

# Shelly variables
deviceid=x
authkey=x

# LogScale variables
logscaleurl=x
ingesttoken=x

curl -sX POST https://shelly-17-eu.shelly.cloud/device/status -d "id=$deviceid&auth_key=$authkey" | \
curl $logscaleurl/api/v1/ingest/hec/raw -X POST -H "Content-Type: text/plain; charset=utf-8" -H "Authorization: Bearer $ingesttoken" -d @-
