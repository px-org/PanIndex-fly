FROM debian:stable-slim

WORKDIR /app

RUN apt update \
    && apt install -y tzdata curl \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
    && apt autoremove \
    && curl -sOL https://github.com/px-org/PanIndex/releases/download/v3.1.4/PanIndex-linux-amd64.tar.gz \
    && tar -xvf PanIndex-linux-amd64.tar.gz -C /app \
    && rm PanIndex-linux-amd64.tar.gz \
    && mv PanIndex-linux-amd64 PanIndex \
    && chmod +x PanIndex

EXPOSE 5238

CMD /app/PanIndex

