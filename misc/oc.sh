oc get all --all-namespaces -o wide
oc get all --all-namespaces -o wide > logs-cluster.all
oc describe route logging-kibana
oc deploy --retry dc/logging-es-data-master-4j3n3wbx
oc delete po/logging-es-data-master-z725a089-1-ljnkf --grace-period=0
# debug:
oc describe pod logging-es-data-master-x1h928ky-1-cwrdp
