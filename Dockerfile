FROM codesimple/elm:0.19

# Create app directory
WORKDIR /app

COPY package*.json yarn.lock ./
RUN npm install

# Bundle app source
COPY . .

RUN npm build

CMD [ "node", "index.js" ]

EXPOSE 4000
