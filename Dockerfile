FROM nginx:14-alpine.12
WORKDIR /app
COPY todoapp.html /usr/share/nginx/html/index.html
RUN npm install
COPY
EXPOSE 4000
CMD ["node","index.js"]
