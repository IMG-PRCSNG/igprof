#!/bin/bash
set -euxo pipefail

(mkdir -p build/install/{lib,include} && \
    cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/opt -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -Wno-attributes" && \
    make -C build -j $(nproc))
