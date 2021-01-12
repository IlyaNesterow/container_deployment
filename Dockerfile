FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Stuff that we will need will be in /app/build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
