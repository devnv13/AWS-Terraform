# Use the latest nginx image from Docker Hub
FROM nginx:latest

# Add custom HTML content to the default nginx web directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]