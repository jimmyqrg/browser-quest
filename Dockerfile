FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

# install dependencies with legacy resolution for old packages
RUN npm install --legacy-peer-deps

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["node", "server/js/main.js"]
