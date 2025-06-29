# cert-manager
Automatically provision and manage TLS certificates in Kubernetes - Namespace specific 

For a more robust and complete solution, please refer to https://github.com/cert-manager/cert-manager. This repo was based on https://github.com/nabsul/k8s-letsencrypt.

## Overview

This docker image was created to automatically create and manage TLS/SSL certificates for nginx ingress for a specific namespace. It is highly recommended that you use tools like cert-manager (https://github.com/cert-manager/cert-manager) to fully enable this feature in Kubernetes cluster (if you have permission). This was created to be used in a Kubernetes cluster that we cannot enable plugins cluster wide.

## Getting started



To first create the certificate you can use (replace the variables in uppercase):
```
certbot certonly --manual --agree-tos -m YOUREMAIL --no-eff-email -d YOURDOMAIN1,YOURDOMAIN2,etc --manual-auth-hook /certbot-authenticator.sh  --manual-cleanup-hook  /certbot-cleanup.sh --non-interactive
```

To renew the certificate, the standard cron routine distributed with certbot should be enough (/etc/cron.d/certbot), but if it fails, just run the command above again

After the renew you should recreate the kubernetes TLS secrete, like:
```
kubectl delete secret [your-cert-name]
kubectl create secret tls [your-cert-name] --cert=fullchain.pem --key=privkey.pem
```

You can create a certbot renew hoook to automatically update the cert like this:
```
cat /etc/letsencrypt/renewal-hooks/deploy/update-kubernets-secret.sh
#!/bin/bash
NAME=$(basename $RENEWED_LINEAGE)
kubectl delete secret tls-cert-$NAME
kubectl create secret tls tls-cert-$NAME --cert=$RENEWED_LINEAGE/fullchain.pem --key=$RENEWED_LINEAGE/privkey.pem

chmod +x /etc/letsencrypt/renewal-hooks/deploy/update-kubernets-secret.sh
```
