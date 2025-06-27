FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y jq

WORKDIR /app

COPY rename.sh /app/rename.sh
RUN chmod +x /app/rename.sh

ENTRYPOINT ["/app/rename.sh"]

