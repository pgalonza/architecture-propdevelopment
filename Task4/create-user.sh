#!/bin/bash

set -x

user_name=$1
group_name=$2

openssl genrsa -out ${user_name}.key 2048
openssl req -new -key ${user_name}.key -out ${user_name}.csr -subj "/CN=${user_name}/O=${group_name}"

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: ${user_name}-csr
spec:
  request: $(cat ${user_name}.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
    - client auth
EOF

minikube kubectl -- certificate approve ${user_name}-csr

minikube kubectl -- get csr ${user_name}-csr -o jsonpath='{.status.certificate}' | base64 -d > ${user_name}.crt