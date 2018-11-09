FROM ruby:2.5-alpine

ENV SLATE_VERSION=v2.3.1

RUN apk update \
     && apk add --no-cache coreutils git make g++ nodejs

RUN git clone https://github.com/lord/slate /slate && \
    cd /slate && \
    git checkout -b $SLATE_VERSION && \
    rm -rf .git

ADD ./stylesheets ./javascripts ./fonts ./images /slate/temp/
ADD ./build.sh /slate


WORKDIR /slate
RUN bundle install --verbose

CMD ["/slate/build.sh"]
