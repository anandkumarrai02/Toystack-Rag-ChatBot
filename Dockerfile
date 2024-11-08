# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Create a non-root user with UID 10001
RUN useradd -u 10001 myuser

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Change ownership of /app to the new user
RUN chown -R myuser /app

# Switch to the non-root user by UID
USER 10001

# Install Python dependencies using requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Expose port for Streamlit (default is 8501)
EXPOSE 8501

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]
