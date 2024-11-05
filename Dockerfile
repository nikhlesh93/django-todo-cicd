

FROM python:3.8

# Install ntpdate to synchronize time
RUN apt-get update && apt-get install -y ntpdate

# Sync the system time with an NTP server
#RUN ntpdate pool.ntp.org

# Install distutils
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory inside the container
WORKDIR /data

# Install Django and other dependencies
RUN pip install --no-cache-dir django==3.2

# Copy project files into the container
COPY . .

# Run migrations (if needed)
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

