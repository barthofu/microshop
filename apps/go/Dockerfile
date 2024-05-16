# ==================
# == dependencies ==
# ==================

FROM golang:1.22.3-alpine AS dependencies-stage

    WORKDIR /app

    # Copy app dependencies requirements
    COPY go.mod ./

    # Install app dependencies
    RUN go mod download

# ==================
# ==== build =======
# ==================

FROM dependencies-stage AS build-stage

    WORKDIR /app

    # Copy app source
    COPY . .

    # Build the app
    RUN CGO_ENABLED=0 GOOS=linux go build -o /app/app

# ==================
# ==== runner ======
# ==================

FROM alpine:3.14 AS runner-stage

    WORKDIR /app

    # Copy app dependencies from previous stage
    COPY --from=build-stage /app/app .

    # Expose the port the app runs in
    EXPOSE 8080

    # Start the app
    CMD ["./app"]