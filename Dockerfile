FROM node:8.9.1-alpine as builder
ENV NODE_ENV=production
ENV HOST=0.0.0.0
WORKDIR /frontend/src

# COPY ./package.json /frontend/src/package.json
# RUN npm install
# COPY . .
# RUN npm run build

# ADD ./package.json /frontend/src/package.json
ADD . /frontend/src
RUN npm install --production
RUN npm run build

# RUN apk update && apk add yarn
# RUN yarn
# COPY . .
# RUN yarn build

FROM nginx:1.13.6
WORKDIR /usr/share/nginx/html
COPY --from=builder /frontend/src/dist .