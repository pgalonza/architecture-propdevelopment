#!/bin/bash

set -x

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: dev-binding
  namespace: default
subjects:
- kind: Group
  name: Developer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: dev-role
  apiGroup: rbac.authorization.k8s.io
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: devops-binding
subjects:
- kind: Group
  name: DevOps
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: devops-role
  apiGroup: rbac.authorization.k8s.io
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: ops-binding
subjects:
- kind: Group
  name: OperationsEngineer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: ops-role
  apiGroup: rbac.authorization.k8s.io
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: security-binding
subjects:
- kind: Group
  name: SecurityEngineer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: security-role
  apiGroup: rbac.authorization.k8s.io
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: support-binding
subjects:
- kind: Group
  name: Support
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: support-role
  apiGroup: rbac.authorization.k8s.io
EOF

cat <<EOF | minikube kubectl -- apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: extended-support-binding
  namespace: default
subjects:
- kind: Group
  name: ExtendedSupport
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: extended-support-role
  apiGroup: rbac.authorization.k8s.io
EOF