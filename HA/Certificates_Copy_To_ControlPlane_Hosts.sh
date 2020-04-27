##Change some file permission to copy root file with normal user
##sudo chmod 644 /etc/kubernetes/admin.conf /etc/kubernetes/pki/ca.key /etc/kubernetes/pki/etcd/ca.key /etc/kubernetes/pki/front-proxy-ca.key /etc/kubernetes/pki/sa.key /etc/kubernetes/pki/sa.pub
## Revert changes:
##sudo chmod 600 /etc/kubernetes/admin.conf /etc/kubernetes/pki/ca.key /etc/kubernetes/pki/etcd/ca.key /etc/kubernetes/pki/front-proxy-ca.key /etc/kubernetes/pki/sa.key /etc/kubernetes/pki/sa.pub
USER=root # customizable
CONTROL_PLANE_IPS="192.168.56.136 192.168.56.137"
for host in ${CONTROL_PLANE_IPS}; do
    scp /etc/kubernetes/pki/ca.crt "${USER}"@$host:
    scp /etc/kubernetes/pki/ca.key "${USER}"@$host:
    scp /etc/kubernetes/pki/sa.key "${USER}"@$host:
    scp /etc/kubernetes/pki/sa.pub "${USER}"@$host:
    scp /etc/kubernetes/pki/front-proxy-ca.crt "${USER}"@$host:
    scp /etc/kubernetes/pki/front-proxy-ca.key "${USER}"@$host:
    scp /etc/kubernetes/pki/etcd/ca.crt "${USER}"@$host:etcd-ca.crt
    scp /etc/kubernetes/pki/etcd/ca.key "${USER}"@$host:etcd-ca.key
    scp /etc/kubernetes/admin.conf "${USER}"@$host:
done