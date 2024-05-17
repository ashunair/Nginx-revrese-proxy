FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Flask application code
COPY app.py .

# Expose port 5000
EXPOSE 5000
# Start Flask application
CMD ["python", "app.py"]
