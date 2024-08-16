FROM node:22-alpine
# RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /build

COPY package*.json ./
USER node
# Install production dependencies and clean the cache
RUN npm ci --omit=dev && npm cache clean --force

# Copy the entire source code into the container
COPY . .
EXPOSE 3000
CMD [ "node", "app.js" ]