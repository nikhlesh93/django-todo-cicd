

FROM python:3

# Install distutils
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory inside the container
WORKDIR /data

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Run migrations (if needed)
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

