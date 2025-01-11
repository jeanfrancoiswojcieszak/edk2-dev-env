#!/bin/bash
qemu-system-x86_64 -pflash ./bios/bios.bin -m 2G -hda fat:rw:out -netdev bridge,id=hn0,br=br0 -device virtio-net-pci,netdev=hn0 -usb -device usb-ehci,id=usb-ehc -device usb-mouse,bus=usb-bus.0,port=2 -device usb-kbd,bus=usb-bus.0,port=1 -drive "if=pflash,format=raw,file=./bios/vars.bin"
