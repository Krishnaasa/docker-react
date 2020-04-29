# Section 1
# Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . . 
# copies all source code, since no changes from here on
RUN npm run build

# Section 2
# RUN phase
# /app/build is what is needed for run phase

FROM nginx
EXPOSE 80
# this is specific to aws ebs port mapping
COPY --from=0 /app/build /usr/share/nginx/html
# RUN nginx is not needed because thats a default 
# cmd for this container