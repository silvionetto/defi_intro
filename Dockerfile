FROM node:alpine as builder
COPY app /app
WORKDIR /app
RUN npm audit fix && npm install

FROM node:alpine as app
COPY --from=builder /app /app 
WORKDIR /app
RUN /bin/sh -c node app.js

ENTRYPOINT ["/bin/sh", "-c"]
# ENTRYPOINT ["/bin/sh", "-c" , "node app.js"]
# ENTRYPOINT ["/bin/sh", "-c" , "pwd & ls & npm run serve"
