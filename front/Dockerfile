FROM node:18.12-alpine3.16

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    # Nodeのバージョンが高すぎることによるエラーが出るため下記を追加
    # 参考：https://github.com/webpack/webpack/issues/14532
    NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /app

# ベースイメージにalpine-nodeを使う場合、node-gyp関連のエラーが出るため下記を追加
# 参考：https://github.com/mhart/alpine-node#example-dockerfile-for-your-own-nodejs-project
RUN apk update && \
    apk upgrade && \
    apk add --no-cache make gcc g++ python3
