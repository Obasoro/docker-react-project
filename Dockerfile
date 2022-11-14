FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.15

EXPOSE 80

COPY --from=builder /app/build/ /usr/share/nginx/html 

#COPY --from=build /nginx.conf /etc/nginx/conf.d/default.conf 