# Use an official Python runtime as a parent image (slim version for smaller size)
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install Python dependencies using requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the .env file to the container
COPY .env /app/.env

# Expose port for Streamlit (default is 8501)
EXPOSE 8501

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]
