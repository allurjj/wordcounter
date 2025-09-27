
FROM nginx:alpine

# Copy the HTML file to nginx's default directory
COPY index.html /usr/share/nginx/html/

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 29532
EXPOSE 29532

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
