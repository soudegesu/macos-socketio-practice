FROM node:12-alpine

RUN mkdir -p /app/api

ADD api /app/api/

RUN apk add --no-cache build-base
RUN cd /app/api && npm install && npm run tsc
RUN apk del build-base

WORKDIR /app/api

EXPOSE 3000

CMD node build/index.js
