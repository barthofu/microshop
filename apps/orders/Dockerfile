# ==================
# == dependencies ==
# ==================

FROM python:3.9-alpine AS dependencies-stage

    WORKDIR /app

    # Copy app dependencies requirements
    COPY requirements.txt ./

    # Install app dependencies
    RUN pip install --no-cache-dir -r requirements.txt

# ==================
# ==== runner ======
# ==================

FROM python:3.9-alpine AS runner-stage

    WORKDIR /app

    # Copy app dependencies from previous stage
    COPY --from=dependencies-stage /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

    # Bundle app source
    COPY . .

    # Expose the port the app runs in
    EXPOSE 8080

    # Start the app
    CMD ["python", "app.py"]