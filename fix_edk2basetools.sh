#!/bin/bash
#cp edk2/BaseTools/Source/C/Common/Decompress.c edk2/BaseTools/Source/C/Common/Decompress.c.orig
grep "^#define UINT8_MAX" edk2/BaseTools/Source/C/Common/Decompress.c 
if [ $? -eq 0 ]; then
    sed -i ".orig" -e "s/^#define UINT8_MAX/\/\/#define UINT8_MAX/g" edk2/BaseTools/Source/C/Common/Decompress.c
fi
