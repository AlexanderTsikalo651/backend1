FROM python:3.12-slim
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY backend1.py .

EXPOSE 5000
ENV FLASK_APP=backend1.py
CMD ["flask", "run", "--host=0.0.0.0"]
