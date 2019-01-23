FROM docker
LABEL maintainer "@flemay"
RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make zip git curl openssl py-pip bash && \
    pip install --upgrade pip docker-compose && \
    curl -LsO https://github.com/dreadl0ck/zeus/releases/download/v0.8.4/zeus_0.8.4_linux_amd64.tar.gz && tar -zxvf *.tar.gz && mv zeus /usr/local/bin/zeus && chmod +x /usr/local/bin/zeus
CMD [ "zeus" ]
