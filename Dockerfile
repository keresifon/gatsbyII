FROM node:14-alpine AS builder
WORKDIR /web
COPY package*.json /web/
RUN npm install 
COPY . .
RUN gatstby build

FROM nginxinc/nginx-unprivileged
WORKDIR /usr/share/nginx/html
#RUN rm -rf ./*
COPY --from=builder /web/build /usr/share/nginx/html