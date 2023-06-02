FROM alpine:latest

WORKDIR /app

RUN apk update \
    && apk add --no-cache tzdata curl \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && curl -sOL https://github.com/px-org/PanIndex/releases/download/v3.1.4/PanIndex-linux-musl-amd64.tar.gz \
    && tar -xvf PanIndex-linux-musl-amd64.tar.gz -C /app \
    && rm PanIndex-linux-musl-amd64.tar.gz LICENSE README.md\
    && mv PanIndex-linux-musl-amd64 PanIndex \
    && chmod +x PanIndex

EXPOSE 5238

CMD /app/PanIndex

