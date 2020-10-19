FROM centos:latest

WORKDIR /usr/src/app

RUN dnf -y install nodejs
RUN dnf -y install nginx 

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build && cp -r build/* /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]