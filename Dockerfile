FROM golang:1.19-alpine

ENV DB_ENGINE=mysql
ENV DB_HOST=10.0.105.3
ENV DB_PORT=3307

WORKDIR /app

RUN apk add gcc 
RUN apk add musl-dev
RUN apk add geos-dev

COPY . /app
RUN go build go-uk-maps.go

CMD ["sh", "-c", "/app/go-uk-maps -dbengine $DB_ENGINE -dbhost $DB_HOST -dbport $DB_PORT"]
