| Роль  | Права роли | Группы пользователей |
| --- | --- | --- |
|dev-role|resources: [“pods”, “services”, “deployments”]<br>verbs: [“get”, “list”, “create”, “update”, “delete”]<br>resources: [“secrets”]<br>verbs: [“list”]|Developer|
|devops-role|resources: [“services”, “deployments”, “secrets”]<br>verbs: [“*”]|DevOps|
|ops-role|resources: [“namespaces”, “services”, “deployments”, “serviceaccounts”, “secrets”]<br>verbs: [“*”]|OperationsEngineer|
|sec-role|resources: [“namespaces”, “services”, “deployments”, “serviceaccounts”]<br>verbs: [“get”, “list”, “watch”]<br>resources: [“secrets”]<br>verbs: [“list”]|SecurityEngineer|
|support-role|resources: [“namespaces”, “services”]<br>verbs: [“get”, “list”, “watch”]|Support|
|extended-support-role|resources: [“pods”, “services”, “deployments”]<br>verbs: [“get”, “list”, “update”]|ExtendedSupport|
