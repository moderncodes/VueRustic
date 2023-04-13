FROM node:lts

WORKDIR /home/alfa/client/

# Update npm to the latest version
RUN npm install -g npm@latest

COPY package*.json ./

RUN npm install

COPY . .