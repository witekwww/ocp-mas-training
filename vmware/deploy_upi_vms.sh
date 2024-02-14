export GOVC_URL='xxxxxxx'
export GOVC_USERNAME='xxxxxx@techzone.ibm.local'
export GOVC_PASSWORD='xxxxx'
export GOVC_INSECURE=1
export GOVC_DATASTORE='xxxxxxxx-storage'
export GOVC_FOLDER='/xxxxxxxxxx/gym-550000532v-ia4savhl'
export GOVC_RESOURCE_POOL='/xxxxxxxxxxxxxxxx/gym-550000532v-ia4savhl'
export GOVC_NETWORK='xxxxxxxxx-segment'

govc datastore.mkdir isos
govc datastore.upload discovery_image_upicluster.iso isos/discovery_image_upicluster.iso

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso cp1
govc vm.change -e="disk.enableUUID=1" -vm=cp1

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso cp2
govc vm.change -e="disk.enableUUID=1" -vm=cp2

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso cp3
govc vm.change -e="disk.enableUUID=1" -vm=cp3

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso w1
govc vm.change -e="disk.enableUUID=1" -vm=w1

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso w2
govc vm.change -e="disk.enableUUID=1" -vm=w2

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso w3
govc vm.change -e="disk.enableUUID=1" -vm=w3

govc vm.create -on=false -c=10 -m=24567 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso i1
govc vm.change -e="disk.enableUUID=1" -vm=i1

govc vm.create -on=false -c=10 -m=24567 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso i2
govc vm.change -e="disk.enableUUID=1" -vm=i2

govc vm.create -on=false -c=10 -m=24567 -disk=160GB -iso-datastore=gym-550000532v-ia4savhl-storage -iso=isos/discovery_image_upicluster.iso i3
govc vm.change -e="disk.enableUUID=1" -vm=i3