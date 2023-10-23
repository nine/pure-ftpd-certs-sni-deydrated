#!/bin/bash

set -e
set -u

echo "${CERTD_SNI_NAME}" | grep -P '(?=^.{1,254}$)(^(?>(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)' || exit 1

echo "action:strict"
echo "cert_file:/var/lib/dehydrated/certs/${CERTD_SNI_NAME}/fullchain.pem"
echo "key_file:/var/lib/dehydrated/certs/${CERTD_SNI_NAME}/privkey.pem"
echo "end"

