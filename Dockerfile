FROM alpine

RUN set -x \
  && apk add --update-cache --no-cache \
    gcc \
    make \
    musl-dev \
    ruby \
    ruby-dev \
  && gem install bundler newrelic_haproxy_agent --no-ri --no-rdoc \
  && apk del \
    gcc \
    make \
    musl-dev \
    ruby-dev

ADD ./start.sh /bin/start-haproxy-newrelic-plugin

CMD ["start-haproxy-newrelic-plugin"]
