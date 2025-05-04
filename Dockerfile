
FROM nginx:alpine

# Create a non-root user
RUN adduser -D myuser

# Change ownership of html directory to the non-root user
RUN chown -R myuser:myuser /usr/share/nginx/html

# Copy the HTML file
COPY todoapp.html /usr/share/nginx/html/index.html

# Switch to non-root user
USER myuser

EXPOSE 80
