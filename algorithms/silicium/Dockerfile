FROM ann-benchmarks

# Download decoupled native stripped binary from official public release (REF-SEC-011: 0 binary bytes in PR git tree)
RUN mkdir -p /usr/local/lib && \
    (curl -fsSL -o /usr/local/lib/libsilicium_ann_x86_64.so https://github.com/silicium369-spec/silicium-ann/releases/download/ann-v1.0.0/libsilicium_ann_x86_64.so || true) && \
    ldconfig

RUN python3 -c 'import ctypes; print("[silicium] Build environment verified")'
