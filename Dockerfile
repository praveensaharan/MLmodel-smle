# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /code

# Copy the current directory contents into the container at /code
COPY . /code/

# Install any needed packages specified in requirements.txt
# It's better to install dependencies from a requirements.txt file
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 to match Cloud Run's expected port
EXPOSE 8080

# Run the FastAPI app using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
