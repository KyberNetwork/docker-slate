FROM ruby:2.5-alpine

ENV SLATE_VERSION=v2.3.1

RUN apk add --no-cache coreutils git make g++ nodejs

RUN git clone --branch $SLATE_VERSION --single-branch --depth 1 https://github.com/lord/slate /slate

WORKDIR /slate

COPY ./stylesheets/ ./javascripts/ ./fonts/ ./images/ /template/
COPY ./build.sh /slate

RUN bundle install --verbose && rm -rf .git

CMD ["/slate/build.sh"]
