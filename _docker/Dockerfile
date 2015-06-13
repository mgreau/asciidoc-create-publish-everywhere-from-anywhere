FROM alpine:latest

RUN apk add --update wget unzip bash ruby ruby-bundler rsync && \
    rm /var/cache/apk/*

ENV BACKENDS /asciidoctor-backends
ENV OUTPUT /output
ENV ASSETS assets
# time in second
ENV REFRESH 1

RUN gem install --no-ri --no-rdoc asciidoctor --version 1.5.2 && \
    gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.7 && \
    gem install --no-ri --no-rdoc slim --version 3.0.3 && \
    gem install --no-ri --no-rdoc haml tilt && \
    mkdir /documents && \
    mkdir -p $OUTPUT && \
    mkdir -p $BACKENDS

RUN wget --no-check-certificate -q -O /tmp/ws.zip https://github.com/joewalnes/websocketd/releases/download/v0.2.10/websocketd-0.2.10-linux_386.zip && \
  unzip -u /tmp/ws.zip -d /tmp/ && \
  rm /tmp/ws.zip

COPY resources/asciidoctor-backends /asciidoctor-backends
COPY resources/scripts/*.sh /tmp/
COPY resources/dzslides $OUTPUT/dzslides
COPY resources/run.html $OUTPUT/index.html

RUN chmod u+x /tmp/*.sh

WORKDIR /documents
VOLUME /documents


CMD ["/tmp/websocketd", "--port=8080", "--dir=/tmp", "--staticdir=/output"]
