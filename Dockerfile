FROM python:3.10.8-slim-buster

# Set the working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the port for Gunicorn (default 8000)
EXPOSE 8000

# Start the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]
py
