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

## iso already in vsphere
govc vm.create -on=false -c=4 -m=16384 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:11 cp1
govc vm.change -e="disk.enableUUID=1" -vm=cp1

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:12 cp2
govc vm.change -e="disk.enableUUID=1" -vm=cp2

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:13 cp3
govc vm.change -e="disk.enableUUID=1" -vm=cp3

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:21 w1
govc vm.change -e="disk.enableUUID=1" -vm=w1

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:22 w2
govc vm.change -e="disk.enableUUID=1" -vm=w2

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:23 w3
govc vm.change -e="disk.enableUUID=1" -vm=w3

govc vm.create -on=false -c=10 -m=24576 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:31 i1
govc vm.change -e="disk.enableUUID=1" -vm=i1

govc vm.create -on=false -c=10 -m=24576 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:32 i2
govc vm.change -e="disk.enableUUID=1" -vm=i2

govc vm.create -on=false -c=10 -m=24576 -disk=160GB -iso-datastore=${GOVC_DATASTORE} -iso=isos/discovery_image_upicluster.iso -net.address=00:50:56:b0:27:33 i3
govc vm.change -e="disk.enableUUID=1" -vm=i3

## iso NOT in vSphere

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -net.address=00:50:56:b0:27:11 cp1
govc vm.change -e="disk.enableUUID=1" -vm=cp1

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -net.address=00:50:56:b0:27:12 cp2
govc vm.change -e="disk.enableUUID=1" -vm=cp2

govc vm.create -on=false -c=4 -m=16384 -disk=160GB -net.address=00:50:56:b0:27:13 cp3
govc vm.change -e="disk.enableUUID=1" -vm=cp3

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -net.address=00:50:56:b0:27:21 w1
govc vm.change -e="disk.enableUUID=1" -vm=w1

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -net.address=00:50:56:b0:27:22 w2
govc vm.change -e="disk.enableUUID=1" -vm=w2

govc vm.create -on=false -c=8 -m=32768 -disk=160GB -net.address=00:50:56:b0:27:23 w3
govc vm.change -e="disk.enableUUID=1" -vm=w3


govc device.cdrom.add -vm=cp1
govc device.cdrom.add -vm=cp1 -controller ide-200
govc device.cdrom.insert -vm=cp1 -ds=${GOVC_DATASTORE} -device=cdrom-3000 isos/discovery_image_ocpinstall.iso

govc device.cdrom.add -vm=cp2
govc device.cdrom.add -vm=cp2 -controller ide-200
govc device.cdrom.insert -vm=cp3 -ds=${GOVC_DATASTORE} -device=cdrom-3000 isos/discovery_image_ocpinstall.iso

govc device.cdrom.add -vm=cp3
govc device.cdrom.add -vm=cp3 -controller ide-200
govc device.cdrom.insert -vm=cp3 -ds=${GOVC_DATASTORE} -device=cdrom-3000 isos/discovery_image_ocpinstall.iso

govc device.cdrom.add -vm=w1
govc device.cdrom.add -vm=w1 -controller ide-200
govc device.cdrom.insert -vm=w1 -ds=${GOVC_DATASTORE} -device=cdrom-3000 isos/discovery_image_ocpinstall.iso

govc device.cdrom.add -vm=w2
govc device.cdrom.add -vm=w2 -controller ide-200
govc device.cdrom.insert -vm=w2 -ds=${GOVC_DATASTORE} -device=cdrom-3000 isos/discovery_image_ocpinstall.iso

govc device.cdrom.add -vm=w3
govc device.cdrom.add -vm=w3 -controller ide-200
govc device.cdrom.insert -vm=w3 -ds=${GOVC_DATASTORE} -device=cdrom-3000 isos/discovery_image_ocpinstall.iso
