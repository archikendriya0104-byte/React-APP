FROM node:alpine3.22 AS build1
WORKDIR /app
COPY package-lock.json .
COPY package.json .
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine

COPY --from=build1 /app/dist /usr/share/nginx/html




