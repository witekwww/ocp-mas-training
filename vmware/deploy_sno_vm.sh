export GOVC_URL='xxxxxxx'
export GOVC_USERNAME='xxxxxx@techzone.ibm.local'
export GOVC_PASSWORD='xxxxx'
export GOVC_INSECURE=1
export GOVC_DATASTORE='xxxxxxxx-storage'
export GOVC_FOLDER='/xxxxxxxxxx/gym-550000532v-ia4savhl'
export GOVC_RESOURCE_POOL='/xxxxxxxxxxxxxxxx/gym-550000532v-ia4savhl'
export GOVC_NETWORK='xxxxxxxxx-segment'


govc datastore.upload discovery_image_sno.iso isos/discovery_image_sno.iso

govc vm.create -on=false -c=16 -m=65536 -disk=200GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_sno.iso snovm
govc vm.change -e="disk.enableUUID=1" -vm=snovm
govc vm.disk.create -vm=snovm -name=disk2 -size 500GB