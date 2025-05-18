FROM python:3

# Set workdir inside container
WORKDIR /app

# Copy your Django project code
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run migrations (optional: can be moved to docker-compose or entrypoint)
RUN python manage.py migrate

# Expose the port (optional for documentation)
EXPOSE 8000

# Start Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

