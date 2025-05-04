FROM nginx:alpine

# Create a non-root user
RUN adduser -D myuser

# Change ownership of necessary dirs
RUN chown -R myuser:myuser /usr/share/nginx/html \
    && chown -R myuser:myuser /var/cache/nginx /var/run /etc/nginx /var/log/nginx /run

# Copy the HTML and rename as index.html
COPY todoapp.html /usr/share/nginx/html/index.html

# Use a custom NGINX conf to avoid writing to /run/nginx.pid
COPY nginx.conf /etc/nginx/nginx.conf

# Switch to non-root user
USER myuser

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
