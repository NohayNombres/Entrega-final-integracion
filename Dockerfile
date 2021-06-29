FROM node:12-alpine as build-stage
RUN mkdir -p /app
WORKDIR /app
COPY ./ecommerce /app

## production
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/. /usr/share/nginx/html
COPY ./conf.d/ /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]