FROM docker.io/library/node:16-alpine

# Create app directory
WORKDIR /app

COPY package*.json yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .

RUN yarn build

CMD [ "node", "index.js" ]

EXPOSE 4000
