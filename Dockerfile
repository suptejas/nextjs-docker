FROM alpine:latest

# Copy all files and directories from the current directory into the container
COPY . /app
WORKDIR /app

# Install the necessary packages
RUN apk update
RUN apk add curl
RUN apk add nodejs npm

# Install Yarn
RUN npm i -g yarn

# Install the necessary packages for the app
RUN yarn install

# Build the Next.js repository
RUN yarn build

# Expose port 3000
EXPOSE 3000

# Run the app
CMD ["yarn" "start"]