FROM nginx:alpine

# Create a non-root user
RUN adduser -D myuser

# Fix permissions for required directories
RUN chown -R myuser:myuser /usr/share/nginx/html \
    && chown -R myuser:myuser /var/cache/nginx /var/run /etc/nginx /var/log/nginx

# Copy your HTML file to index.html so it loads at "/"
COPY todoapp.html /usr/share/nginx/html/index.html

# Switch to non-root user
USER myuser

# Expose default Nginx port
EXPOSE 80

# Start Nginx (this is the default CMD from nginx:alpine)
