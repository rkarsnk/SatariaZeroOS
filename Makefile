WORKDIR := $(CURDIR)
EDK2DIR := $(WORKDIR)/edk2
OUTPUT := $(EDK2DIR)/Build/MikanLoaderX64/DEBUG_CLANGPDB/X64/MikanLoaderPkg/Loader/OUTPUT

LoaderPkgDir := MikanLoaderPkg
LoaderPkgDsc := MikanLoaderPkg.dsc
LoaderPkgExists := $(shell ls $(EDK2DIR) |grep ${LoaderPkgDir})

LDFLAGS := -L/usr/local/opt/binutils/lib
CPPFLAGS := -I/usr/local/opt/binutils/include

.PHONY:edk2tools
edk2tools:
	make -C $(EDK2DIR)/BaseTools/Source/C

.PHONY:loader
loader:
	rm -rf $(EDK2DIR)/$(LoaderPkgDir)
	ln -s $(WORKDIR)/$(LoaderPkgDir) $(EDK2DIR)/$(LoaderPkgDir)
	WORKDIR=$(WORKDIR) script/build_loader.sh

.PHONY:run
run:
	$(WORKDIR)/osbook/devenv/run_qemu.sh $(OUTPUT)/Loader.efi

clean:
	rm -rf $(EDK2DIR)/Build/MikanLoaderX64
