#! /usr/bin/sh -x

export PACKER_LOG=1
export PACKER_LOG_PATH=packer-build.log
time packer build -on-error=ask -force packer.json

