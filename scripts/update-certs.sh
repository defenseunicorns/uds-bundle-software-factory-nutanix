#!/bin/bash
##
## This script can be used after a fresh deploy to remove the default (bigbang.dev) cert secret
##   from the istio-system namespace and create new secrets with the `*.mtsi.bigbang.dev` cert.
##
## PREREQS:
##   * Access to mtsi-bigbang-dev-fullchain.pem (contact ablanchard)
##   * Access to mtsi-bigbang-dev-privkey.pem (contact ablanchard)

# remove the existing cert secrets
kubectl delete secret -n istio-system admin-cert
kubectl delete secret -n istio-system tenant-cert

# create new cert secrets
kubectl create -n istio-system secret tls admin-cert \
  --key=$(git rev-parse --show-toplevel)/scripts/mtsi-bigbang-dev-privkey.pem \
  --cert=$(git rev-parse --show-toplevel)/scripts/mtsi-bigbang-dev-fullchain.pem

kubectl create -n istio-system secret tls tenant-cert \
  --key=$(git rev-parse --show-toplevel)/scripts/mtsi-bigbang-dev-privkey.pem \
  --cert=$(git rev-parse --show-toplevel)/scripts/mtsi-bigbang-dev-fullchain.pem