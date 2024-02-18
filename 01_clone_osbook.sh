#!/bin/bash
if [ ! -d osbook ]; then
    git clone https://github.com/uchan-nos/mikanos-build.git osbook
fi

if [ -d osbook ]; then
    cp osbook/devenv/make_image.sh osbook/devenv/make_image.sh.orig
    cp osbook/devenv/mount_image.sh osbook/devenv/mount_image.sh.orig
    cp osbook/devenv/run_image.sh osbook/devenv/run_image.sh.orig
    cp devenv_mac/* osbook/devenv
fi
