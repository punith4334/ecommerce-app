# Use Node.js as the base image
FROM node:14

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /app

# Copy package.json first, then install dependencies
COPY package.json package-lock.json .  
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port
EXPOSE 3000

# Start the application
CMD ["node", "server/server.js"]
