FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

# Replace the dead dependency
RUN sed -i 's/"websocket-server":.*$/"ws": "^8.13.0",/' package.json

# Install deps
RUN npm install --legacy-peer-deps

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["node", "server/js/main.js"]
