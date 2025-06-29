#!/bin/bash
mkdir -p /var/tmp/.well-known/acme-challenge
echo $CERTBOT_VALIDATION > /var/tmp/.well-known/acme-challenge/$CERTBOT_TOKEN
