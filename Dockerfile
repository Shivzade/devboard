# Get the Base image
FROM node:24

# Create the working Directory to store all the files
WORKDIR /app

# Copy all the source code from host to container
COPY . .

# Run he necessary commands required to install the application
RUN npm install

# Indicate the port used
EXPOSE 5173

# Run the application
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
