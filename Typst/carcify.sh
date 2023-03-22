#!/bin/zsh
(cd .. && cbindgen --config cbindgen.toml --output Typst/BridgingHeader.h)
cargo build -Z unstable-options --out-dir Libraries/ --target-dir RustTarget/
ln -sf $(pwd)/RustTarget/*/libtypst_mac.d RustTarget/libtypst_mac.d
