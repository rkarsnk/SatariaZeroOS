# SatariaZeroOS
```

  #####                                      #######                      
 #     #   ##   #####   ##   #####  #   ##        #  ###### #####   ####  
 #        #  #    #    #  #  #    # #  #  #      #   #      #    # #    # 
  #####  #    #   #   #    # #    # # #    #    #    #####  #    # #    # 
       # ######   #   ###### #####  # ######   #     #      #####  #    # 
 #     # #    #   #   #    # #   #  # #    #  #      #      #   #  #    # 
  #####  #    #   #   #    # #    # # #    # ####### ###### #    #  ####  
                                                                          

```
macOS Sonomaで「ゼロからのOS自作入門」を進めための作業リポジトリ


## 準備
### `tianocore/edk2`のクローン
[`tianocore/edk2`](https://github.com/tianocore/edk2)の`edk2-stable202311`を取得する．

取得後，macOS Sonoma (Intel)でビルドできるようにするため，`edk2`の`BaseTools`のソースコードを一部修正する．
```
./00_clone_edk2.sh
```
上のスクリプトではedk2のclone/checkout後に，edk2が使用するsubmoduleレポジトリについても取得している．

### `uchan-nos/mikanos-build`のクローン
[`uchan-nos/mikanos-build`](https://github.com/uchan-nos/mikanos-build)を`osbook`ディレクトリに取得する．

`osbook/devenv`以下にあるスクリプトは一部macOSでは動作しないため，`devenv_mac`以下のものに置き換える．

```
./01_clone_osbook.sh
```

### `edk2/BaseTools`のビルド
```
make edk2tools
```
内部では，以下の処理を実行しているだけ．
```
make -C edk2/BaseTools/Source/C
```

## ブートローダのビルド
ブートローダのソースコードは`MikanLoaderPkg`以下の置いてある．`edk2-stable202311`でビルドできるように，`MikanLoaderPkg.{dec,dsc}`の記述を一部変更している．
また，みかん本に記載の`edk2/Conf/target.txt`を参照してビルドする方法は採用せず，下の例のように`build`コマンドにパラメータを渡してビルドする方法を取っている．
```
build -p MikanLoaderPkg/MikanLoaderPkg.dsc -b DEBUG -a X64 -t CLANGPDB
```

ビルドを含む，ビルド前の準備作業については`Makefile`の`loader`ルールに記載しているので，以下のコマンドでブートローダのビルドができるようになっている．
```
make loader
```

