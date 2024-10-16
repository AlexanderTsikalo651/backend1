FROM python:3.12
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y git 
COPY . .
RUN git stash
RUN git checkout v2.0
ENV FLASK_APP=backend1
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
