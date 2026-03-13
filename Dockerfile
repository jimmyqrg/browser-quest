# Use a lightweight Node image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies first (better layer caching)
COPY package*.json ./
RUN npm install --production

# Copy the rest of the project
COPY . .

# BrowserQuest normally runs on 8000
ENV PORT=8080
EXPOSE 8080

# Start the game server
CMD ["node", "server.js"]
