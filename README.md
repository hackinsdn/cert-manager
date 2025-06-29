# cert-manager
Automatically provision and manage TLS certificates in Kubernetes - Namespace specific 

For a more robust and complete solution, please refer to https://github.com/cert-manager/cert-manager. This repo was based on https://github.com/nabsul/k8s-letsencrypt.

## Overview

This docker image was created to automatically create and manage TLS/SSL certificates for nginx ingress for a specific namespace. It is highly recommended that you use tools like cert-manager (https://github.com/cert-manager/cert-manager) to fully enable this feature in Kubernetes cluster (if you have permission). This was created to be used in a Kubernetes cluster that we cannot enable plugins cluster wide.

## Getting started

TODO
