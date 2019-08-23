FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY public public

COPY babel.config.js .

COPY src src

CMD npm run build