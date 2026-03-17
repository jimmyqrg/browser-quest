FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# Install deps (no sed hack)
RUN npm install --legacy-peer-deps

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["node", "server/js/main.js"]
