FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm config set unsafe-perm true

RUN npm install --allow-root

RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache

COPY . . 

RUN npm run build 


FROM nginx
EXPOSE 80
COPY --from=0  /app/build  /usr/share/nginx/html 





