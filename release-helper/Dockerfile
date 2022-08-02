FROM node:15.5-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk --update upgrade && \
    apk add git ca-certificates tzdata && \
    rm -rf /var/cache/apk/* && \
    npm install -g -registry=https://registry.npm.taobao.org/ \
  conventional-changelog \
  conventional-changelog-cli \
  cz-conventional-changelog \
  commitizen \
  standard-version

COPY --from=mikefarah/yq:4.25.3 /usr/bin/yq /usr/bin/yq
COPY --from=zc2638/releaser:0.0.3 /bin/releaser /usr/bin/releaser

ENV TZ=Asia/Shanghai
