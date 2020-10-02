FROM node:8.16

ENV CODE /usr/src/app
WORKDIR $CODE

#RUN mkdir -p $CODE
COPY package.json yarn.lock ./
ADD public $CODE/public
ADD server $CODE/server
ADD src $CODE/src

RUN yarn
COPY . ./

RUN yarn build:css
RUN yarn build

EXPOSE 8282
CMD ["node", "server"]
