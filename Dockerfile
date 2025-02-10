FROM conduit.docker.scarf.sh/conduitio/conduit:v0.13.1

# Download the release
ADD https://github.com/conduitio-labs/conduit-connector-mongo/releases/download/v0.1.2/conduit-connector-mongo_0.1.2_Linux_x86_64.tar.gz /tmp/connector.tar.gz

# Extract and copy only the binary
RUN tar -xzf /tmp/connector.tar.gz -C /tmp && \
    mkdir -p ./connectors && \
    mv /tmp/conduit-connector-mongo ./connectors/ && \
    rm /tmp/connector.tar.gz
