FROM golang:1.7-alpine

RUN mkdir -p "$GOPATH/src"
ADD . "$GOPATH/src/app"

WORKDIR "$GOPATH/src/app"

RUN apk --no-cache --virtual .build-dependencies add git \
    && go-wrapper download \
    && go-wrapper install \
    && apk del .build-dependencies

EXPOSE 80

CMD ["go-wrapper", "run"]
