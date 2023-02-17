FROM ruby:3.1.2-alpine3.16

ARG RUNTIME_PACKAGES="nodejs tzdata mysql-dev mysql-client git imagemagick"
ARG DEV_PACKAGES="build-base curl-dev"

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR /app

COPY Gemfile* ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    # M1Macの場合、nokogiriのエラーが出るので下記1文を追加
    # 参考：https://abillyz.com/watanabe/studies/244
    bundle config set force_ruby_platform true && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . .
