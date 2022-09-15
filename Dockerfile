FROM debian:10-slim
MAINTAINER libsgh
ENV TZ=Asia/Shanghai
RUN apt-get update
RUN apt-get install -y curl
WORKDIR /app
COPY run.sh /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
ENTRYPOINT ["/bin/bash"]
