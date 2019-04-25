#!/bin/bash -e

# sync the index.html file with caching disabled
aws --profile zilch s3 sync \
    --cache-control "no-cache" \
    --content-type "text/html" \
    --exclude "*" \
    --include "index.html" \
    --storage-class REDUCED_REDUNDANCY \
    dist s3://app.zilch.me/

# sync favicon.ico
aws --profile zilch s3 sync \
    --cache-control "max-age=3600" \
    --content-type "image/x-icon" \
    --exclude "*" \
    --include "favicon.ico" \
    --storage-class REDUCED_REDUNDANCY \
    dist s3://app.zilch.me/

# sync css
aws --profile zilch s3 sync \
    --cache-control "max-age=3600" \
    --content-type "text/css" \
    --delete \
    --exclude "*" \
    --include "*.css" \
    --storage-class REDUCED_REDUNDANCY \
    dist/css s3://app.zilch.me/css/

# sync img
aws --profile zilch s3 sync \
    --cache-control "max-age=3600" \
    --content-type "image/png" \
    --delete \
    --exclude "*" \
    --include "*.png" \
    --storage-class REDUCED_REDUNDANCY \
    dist/img s3://app.zilch.me/img/

# sync js
aws --profile zilch s3 sync \
    --cache-control "max-age=3600" \
    --content-type "text/javascript" \
    --delete \
    --exclude "*" \
    --include "*.js" \
    --storage-class REDUCED_REDUNDANCY \
    dist/js s3://app.zilch.me/js/

# sync js.map
aws --profile zilch s3 sync \
    --cache-control "max-age=3600" \
    --content-type "application/json" \
    --delete \
    --exclude "*" \
    --include "*.js.map" \
    --storage-class REDUCED_REDUNDANCY \
    dist/js s3://app.zilch.me/js/
