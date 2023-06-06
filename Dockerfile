FROM alpine:latest
EXPOSE 5238
WORKDIR /app

ENV PANINDEX_VERSION v3.1.4

RUN apk update && \
    apk add --no-cache tzdata curl && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    curl -sOL https://github.com/px-org/PanIndex/releases/download/$PANINDEX_VERSION/PanIndex-linux-musl-amd64.tar.gz && \
    tar -xvf PanIndex-linux-musl-amd64.tar.gz -C /app && \
    mv PanIndex-linux-musl-amd64 PanIndex && \
    chmod +x PanIndex && \
    apk del curl && \
    rm PanIndex-linux-musl-amd64.tar.gz LICENSE README.md && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

CMD /app/PanIndex

