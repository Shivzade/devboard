# Get the Base image
FROM node:20-alpine

#Create a dedicated non root user. Running as a root inside the container
RUN addgroup -S app && adduser -S -G app app

# npm ci installs the exact version from package-lock.json
COPY package*.json ./
RUN npm ci

# Create the working Directory to store all the files
WORKDIR /app

# Copy all the source code from host to container
COPY . .
RUN npm run build

#Give the non root user ownership of the app. Then switch to it.
RUN chown -R app:app /app
user app

# Indicate the port used
EXPOSE 5173

# Run the application
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "4173"]
