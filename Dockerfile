#we are building the dockerfile in phases
#head over to udemy training (multistep docker file) for more details
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#to run this
#docker build .
#docker run -p 8080:80 <image_id>