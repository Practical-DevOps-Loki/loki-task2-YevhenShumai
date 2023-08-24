# Use an official Go runtime as the base image
FROM golang:1.16-alpine AS build

# Set the working directory
WORKDIR /app

# Copy the application source code into the container
COPY . .

# Build the Go application
RUN go build -o webapp .

# Use a minimal base image for the final container
FROM alpine:3.14

# Copy the binary from the build stage
COPY --from=build /app/webapp /webapp

# Expose the application port
EXPOSE 8080

# Run the application binary
CMD ["/webapp"]

