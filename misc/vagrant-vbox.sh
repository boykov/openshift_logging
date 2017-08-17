vboxmanage startvm vagrant_master1_1502929565309_62865 --type headless
vboxmanage startvm vagrant_admin1_1502929643087_89701 --type headless
vboxmanage showvminfo openshift-origin
vboxmanage showvminfo vagrant_master1_1502929565309_62865
vboxmanage controlvm vagrant_master1_1502929565309_62865 poweroff
vboxmanage modifyvm  --memory 2048
vboxmanage unregistervm vagrant_admin1_1502896457278_79869 --delete

vboxmanage controlvm vagrant_admin1_1502896457278_79869 poweroff
vboxmanage unregistervm  vagrant_admin1_1502871240227_42242  --delete

vboxmanage snapshot vagrant_master1_1502929565309_62865 take master1_before
vboxmanage snapshot vagrant_master1_1502929565309_62865 restore master1_before

"vagrant_master1_1502929565309_62865" {7d05fdfe-44a2-469c-aab0-8a977e370072}
"vagrant_admin1_1502929643087_89701" {1e3e112a-f8e4-40be-89b6-1de7319bc4d2}
vboxmanage controlvm vagrant_admin1_1502929643087_89701 poweroff
vboxmanage controlvm vagrant_master1_1502929565309_62865 poweroff
vboxmanage modifyvm vagrant_admin1_1502929643087_89701 --memory 256
vboxmanage modifyvm vagrant_master1_1502929565309_62865 --memory 2248
vboxmanage modifyvm vagrant_master1_1502929565309_62865 --cpus 4

ssh admin1
cd /home/vagrant/sync/vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="OSEv3:localhost" --inventory-file=/tmp/vagrant-ansible/inventory -v /home/vagrant/openshift-ansible/playbooks/byo/config.yml

cd /home/vagrant/sync/vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="OSEv3:localhost" --inventory-file=/tmp/vagrant-ansible/inventory -v /home/vagrant/openshift-ansible/playbooks/byo/openshift-cluster/openshift-logging.yml


vboxmanage controlvm vagrant_master1_1502881125271_20826 poweroff
vboxmanage modifyvm vagrant_master1_1502881125271_20826 --memory 2048
vboxmanage startvm vagrant_master1_1502881125271_20826 --type headless
# fix vagrant errors after installing a new version
sudo modprobe vboxnetadp
sudo modprobe vboxdrv
sudo modprobe vboxnetflt
