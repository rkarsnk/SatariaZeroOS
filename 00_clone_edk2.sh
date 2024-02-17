#!/bin/bash
EDK2DIR=edk2
if [ ! -d edk2 ]; then
    git clone --recursive https://github.com/tianocore/edk2.git -b edk2-stable202311 edk2
fi

if [ -d edk2/BaseTools/Source/C/Common ]; then
    grep "^#define UINT8_MAX" edk2/BaseTools/Source/C/Common/Decompress.c 
    if [ $? -eq 0 ]; then
        sed -i ".orig" -e "s/^#define UINT8_MAX/\/\/#define UINT8_MAX/g" edk2/BaseTools/Source/C/Common/Decompress.c
    fi
fi
