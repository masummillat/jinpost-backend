FROM node:12.18.2-alpine3.11

ARG environment
ARG version

ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/jinpost

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm i

COPY . .

RUN npm run build

RUN echo "npm run start:prod" > entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["sh", "/usr/src/jinpost/entrypoint.sh"]