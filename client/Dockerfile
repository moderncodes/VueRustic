FROM node:lts

WORKDIR /home/alfa/client/

# Update npm to the latest version
RUN npm install -g npm@latest

COPY package*.json ./

RUN npm install

COPY . .

ENV NODE_ENV=development

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--config", "vite.hmr.config.js"]