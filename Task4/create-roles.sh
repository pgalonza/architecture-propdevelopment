#!/bin/bash

set -x

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: dev-role
  namespace: default
rules:
  - apiGroups: ["", "apps"]
    resources: ["pods", "services", "deployments"]
    verbs: ["get", "list", "create", "update", "delete"]
  - apiGroups: [""]
    resources: ["secrets"]
    verbs: ["list"]
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: devops-role
rules:
  - apiGroups: ["", "apps"]
    resources: ["services", "deployments", "secrets"]
    verbs: ["*"]
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: ops-role
rules:
  - apiGroups: ["", "apps"]
    resources: ["namespaces", "services", "deployments", "serviceaccounts", "secrets"]
    verbs: ["*"]
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: security-role
rules:
  - apiGroups: ["", "apps"]
    resources: ["namespaces", "services", "deployments", "serviceaccounts"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["secrets"]
    verbs: ["list"]
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
 name: support-role
rules:
  - apiGroups: ["", "apps"]
    resources: ["namespaces", "services",]
    verbs: ["get", "list", "watch"]
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
 name: extended-support-role
rules:
  - apiGroups: ["", "apps"]
    resources: ["pods", "services", "deployments"]
    verbs: ["get", "list", "update"]
EOF