#!/bin/bash


# 環境変数WORKDIRの設定
if [  -z $WORKDIR ] ; then
  WORKDIR=`pwd`
fi
echo "WORKDIR=$WORKDIR"

EDK2DIR="$WORKDIR/edk2"

# build MikanLoaderPkg
BINUTILS_L="-L`brew --prefix binutils`/lib"
BINUTILS_H="-I`brew --prefix binutils`/include"

LoaderPkgDir="MikanLoaderPkg"
LoaderPkgDsc="MikanLoaderPkg.dsc"

WORKSPACE="$EDK2DIR" source "$EDK2DIR/edksetup.sh"
LDFLAGS="$BINUTILS_L" CPPFLAGS="$BINUTILS_H" WORKSPACE="$EDK2DIR" build -p $LoaderPkgDir/$LoaderPkgDsc -b DEBUG -a X64 -t CLANGPDB


