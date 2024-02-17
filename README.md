# SatariaZeroOS
macOS Sonomaで「ゼロからのOS自作入門」を進めための作業リポジトリ

## 準備
### `tianocore/edk2`のクローン
[`tianocore/edk2`](https://github.com/tianocore/edk2)の`edk2-stable202311`を取得する．

取得後，macOS Sonoma (Intel)でビルドできるようにするため，`edk2`の`BaseTools`のソースコードを一部修正する．
```
./00_clone_edk2.sh
```

### `uchan-nos/mikanos-build`のクローン
[`uchan-nos/mikanos-build`](https://github.com/uchan-nos/mikanos-build)を`osbook`ディレクトリに取得する．

`osbook/devenv`以下にあるスクリプトは一部macOSでは動作しないため，`devenv_mac`以下のものに置き換える．

```
./01_clone_osbook.sh
```

### `edk2/BaseTools`のビルド

```
make basetools
```