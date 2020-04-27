###Create this script in /home/$USER/certs/
## Copy below lines to this script
## make it executable

USER=centos # customizable
##change relevant ownership
sudo chown -R root:root admin.conf  ca.crt  ca.key  etcd-ca.crt  etcd-ca.key  front-proxy-ca.crt  front-proxy-ca.key  sa.key  sa.pub
sudo chmod 600 ca.key front-proxy-ca.key sa.key sa.pub etcd-ca.key admin.conf 
##copy certs to specified location

sudo mkdir -p /etc/kubernetes/pki/etcd
sudo mv ca.crt /etc/kubernetes/pki/
sudo mv ca.key /etc/kubernetes/pki/
sudo mv sa.pub /etc/kubernetes/pki/
sudo mv sa.key /etc/kubernetes/pki/
sudo mv front-proxy-ca.crt /etc/kubernetes/pki/
sudo mv front-proxy-ca.key /etc/kubernetes/pki/
sudo mv etcd-ca.crt /etc/kubernetes/pki/etcd/ca.crt
sudo mv etcd-ca.key /etc/kubernetes/pki/etcd/ca.key
sudo mv admin.conf /etc/kubernetes/admin.conf

