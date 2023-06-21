FROM docker.io/library/node:16-alpine

RUN apk add --update python3 make g++\
   && rm -rf /var/cache/apk/*

# Create app directory
WORKDIR /app

COPY package*.json yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .

RUN yarn build

CMD [ "node", "index.js" ]

EXPOSE 4000
