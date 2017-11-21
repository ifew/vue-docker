FROM node:8.9.1-alpine as builder
ENV NODE_ENV=development
ENV HOST=0.0.0.0
WORKDIR /frontend/src

# build image
ADD . .
RUN npm install
RUN npm run build

# build server
FROM nginx:1.13.6
WORKDIR /usr/share/nginx/html
COPY --from=builder /frontend/src/dist .