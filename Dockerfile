# Use the specific version of Python
FROM python:3.9.13

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && apt-get install -y netcat

# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy entrypoint script
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Copy project
COPY . /app/

# Install gunicorn
RUN pip install gunicorn

# Expose the port the app runs on
EXPOSE 8000

# Use entrypoint script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Start the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "website.wsgi:application"]
