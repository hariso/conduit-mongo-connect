FROM conduit.docker.scarf.sh/conduitio/conduit:v0.13.1

# Detect architecture and download correct binary
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then BINARY_ARCH="x86_64"; else BINARY_ARCH="arm64"; fi && \
    wget https://github.com/conduitio-labs/conduit-connector-mongo/releases/download/v0.1.2/conduit-connector-mongo_0.1.2_Linux_${BINARY_ARCH}.tar.gz -O /tmp/connector.tar.gz && \
    tar -xzf /tmp/connector.tar.gz -C /tmp && \
    mkdir -p ./connectors && \
    mv /tmp/conduit-connector-mongo ./connectors/ && \
    rm /tmp/connector.tar.gz