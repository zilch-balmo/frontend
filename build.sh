#!/bin/bash -e

aws --profile zilch s3 sync \
    --cache-control "max-age=3600" \
    --content-type "text/html" \
    --exclude "*" \
    --include "*.html" \
    --storage-class REDUCED_REDUNDANCY \
    . s3://app.zilch.me/

aws --profile zilch cloudfront create-invalidation \
    --distribution-id E661RNZAXZTJI \
    --paths /index.html
