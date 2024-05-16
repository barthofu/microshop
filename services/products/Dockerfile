# ==================
# == dependencies ==
# ==================

FROM node:20-alpine AS dependencies-stage

    WORKDIR /app

    # Copy app dependencies requirements
    COPY package.json package-lock.json ./

    # Install app dependencies
    RUN npm install

# ==================
# ==== runner ======
# ==================

FROM node:20-alpine AS runner-stage

    WORKDIR /app

    # Copy app dependencies from previous stage
    COPY --from=dependencies-stage /app/node_modules ./node_modules

    # Bundle app source
    COPY . .

    # Expose the port the app runs in
    EXPOSE 8080

    # Start the app
    CMD ["npm", "start"]