##Change some file permission to copy root file with normal user
##sudo chmod 644 /etc/kubernetes/admin.conf /etc/kubernetes/pki/ca.key /etc/kubernetes/pki/etcd/ca.key /etc/kubernetes/pki/front-proxy-ca.key /etc/kubernetes/pki/sa.key /etc/kubernetes/pki/sa.pub
## Revert changes:
##sudo chmod 600 /etc/kubernetes/admin.conf /etc/kubernetes/pki/ca.key /etc/kubernetes/pki/etcd/ca.key /etc/kubernetes/pki/front-proxy-ca.key /etc/kubernetes/pki/sa.key /etc/kubernetes/pki/sa.pub
sudo chmod 644 /etc/kubernetes/admin.conf /etc/kubernetes/pki/ca.key /etc/kubernetes/pki/etcd/ca.key /etc/kubernetes/pki/front-proxy-ca.key /etc/kubernetes/pki/sa.key /etc/kubernetes/pki/sa.pub
USER=centos # customizable
CONTROL_PLANE_IPS="172.16.1.163 172.16.1.217"
for host in ${CONTROL_PLANE_IPS}; do
    mkdir /home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/ca.crt "${USER}"@$host:/home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/ca.key "${USER}"@$host:/home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/sa.key "${USER}"@$host:/home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/sa.pub "${USER}"@$host:/home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/front-proxy-ca.crt "${USER}"@$host:/home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/front-proxy-ca.key "${USER}"@$host:/home/"${USER}"/certs
    scp -r /etc/kubernetes/pki/etcd/ca.crt "${USER}"@$host:/home/"${USER}"/certs/etcd-ca.crt
    scp -r /etc/kubernetes/pki/etcd/ca.key "${USER}"@$host:/home/"${USER}"/certs/etcd-ca.key
    scp -r /etc/kubernetes/admin.conf "${USER}"@$host:/home/"${USER}"/certs
done

## Revert changes:
sudo chmod 600 /etc/kubernetes/admin.conf /etc/kubernetes/pki/ca.key /etc/kubernetes/pki/etcd/ca.key /etc/kubernetes/pki/front-proxy-ca.key /etc/kubernetes/pki/sa.key /etc/kubernetes/pki/sa.pub
