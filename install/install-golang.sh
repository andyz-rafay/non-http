mkdir -p /tmp/download
cd /tmp/download  && wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
cd /tmp/download && tar xzvf go1.11.linux-amd64.tar.gz
cd /tmp/download && sudo mv go /usr/local
cd /tmp && rm -rf download
