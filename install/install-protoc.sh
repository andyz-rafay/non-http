mkdir -p /tmp/download
cd /tmp/download  && curl -OL https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip
cd /tmp/download && unzip "protoc-3.5.1-linux-x86_64.zip" -d protoc3
cd /tmp/download && sudo mv protoc3/bin/* /usr/local/bin/
cd /tmp/download && sudo mv protoc3/include/* /usr/local/include/
cd /tmp && sudo  rm -rf download
