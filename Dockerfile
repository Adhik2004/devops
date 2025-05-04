FROM nginx:alpine

# Create a non-root user and prepare nginx directories with correct permissions
RUN adduser -D myuser && \
    mkdir -p /var/cache/nginx/client_temp && \
    chown -R myuser:myuser /usr/share/nginx/html /var/cache/nginx /var/run /etc/nginx /var/log/nginx

# Copy your HTML file as index.html
COPY todoapp.html /usr/share/nginx/html/index.html

# Switch to non-root user
USER myuser

# Expose port 80 for HTTP traffic
EXPOSE 80
