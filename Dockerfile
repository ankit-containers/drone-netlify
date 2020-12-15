FROM node:alpine
LABEL maintainer="Ankit R Gadiya ankit@argp.in"

RUN npm install --global netlify-cli
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
