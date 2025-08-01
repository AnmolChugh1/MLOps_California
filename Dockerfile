# Use an official lightweight Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy only necessary files
COPY Requirements.txt .
RUN pip install --no-cache-dir -r Requirements.txt

# Copy source code
COPY src/ src/

# Copy trained model if available
COPY model.joblib .

# Default command: run prediction
CMD ["python", "src/predict.py"]
