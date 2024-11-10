# Use official Python image
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Install gunicorn explicitly
RUN pip install gunicorn

# Environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Expose port
EXPOSE 5000

# Entry command
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]