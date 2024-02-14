oc new-project mssqlfts2019

oc create -f scc.yaml
oc adm policy add-scc-to-group restrictedfsgroup system:serviceaccounts:mssql

oc create secret generic mssql --from-literal=SA_PASSWORD="Sql2019isfast"

oc apply -f storage.yaml

oc apply -f deployment.yaml