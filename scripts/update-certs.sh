#!/bin/bash
##
## This script can be used after a fresh deploy to remove the default (bigbang.dev) cert secret
##   from the istio-system namespace and create new secrets with the `*.mtsi.bigbang.dev` cert.
##
## PREREQS:
##   * Access to mtsi-bigbang-dev-fullchain.pem (contact ablanchard)
##   * Access to mtsi-bigbang-dev-privkey.pem (contact ablanchard)

cert=$1
key=$2

# remove the existing cert secrets
kubectl delete secret -n istio-system admin-cert
kubectl delete secret -n istio-system tenant-cert
kubectl delete secret -n keycloak keycloak-tlskey
kubectl delete secret -n keycloak keycloak-tlscert

# create new cert secrets
kubectl create -n istio-system secret tls admin-cert \
  --key=$(git rev-parse --show-toplevel)/$key \
  --cert=$(git rev-parse --show-toplevel)/$cert

kubectl create -n istio-system secret tls tenant-cert \
  --key=$(git rev-parse --show-toplevel)/$key \
  --cert=$(git rev-parse --show-toplevel)/$cert

kubectl create -n keycloak secret generic keycloak-tlskey --from-file=tls.key=$(git rev-parse --show-toplevel)/$key
kubectl create -n keycloak secret generic keycloak-tlscert --from-file=tls.crt=$(git rev-parse --show-toplevel)/$cert

# restart keycloak
kubectl rollout restart statefulset -n keycloak keycloak