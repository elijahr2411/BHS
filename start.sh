#!/usr/bin/env bash

# Define variables
FILE="blockheads_server171"
declare -A LIBS=(
    ["libgnustep-base.so.1.24"]="libgnustep-base.so.1.30"
    ["libobjc.so.4.6"]="libobjc.so.4.7"
    ["libgnutls.so.26"]="libgnutls.so.3.7"
    ["libgcrypt.so.11"]="libgcrypt.so.1.10.0"
    ["libxml2.so.2"]="libxml2.so.2"
    ["libffi.so.6"]="libffi.so.3.4"
    ["libnsl.so.1"]="libnsl.so.1"
    ["librt.so.1"]="librt.so.1"
    ["libdl.so.2"]="libdl.so.2"
    ["libpthread.so.0"]="libpthread.so.0"
    ["libz.so.1"]="libz.so.1"
    ["libicui18n.so.48"]="libicui18n.so.70.1"
    ["libicuuc.so.48"]="libicuuc.so.70.1"
    ["libicudata.so.48"]="libicudata.so.70.1"
    ["libdispatch.so"]="libdispatch.so.0.1"
    ["libm.so.6"]="libm.so.6"
    ["libstdc++.so.6"]="libstdc++.so.6"
    ["libgcc_s.so.1"]="libgcc_s.so.1"
    ["libc.so.6"]="libc.so.6"
)

# Replace needed libraries
for LIB in "${!LIBS[@]}"; do
    patchelf --replace-needed $LIB ${LIBS[$LIB]} $FILE || { echo "Failed to patch the BHS for $LIB"; exit 1; }
done

echo "The BHS has been patched successfully!"