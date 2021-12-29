FROM node:alpine as builder
WORKDIR /app
COPY . /app
RUN npm install  

FROM node:alpine as app
WORKDIR /usr/src/app
COPY --from=builder /app /app 
ENTRYPOINT ["/bin/sh", "-c" , "node app.js"
# ENTRYPOINT ["/bin/sh", "-c" , "pwd & ls & npm run serve"
