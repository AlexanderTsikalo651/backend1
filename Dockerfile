# Используем образ Python 3.12
FROM python:3.12

# Устанавливаем рабочий каталог в /app
WORKDIR /app

# Копируем файл requirements.txt в рабочий каталог
COPY requirements.txt .

# Устанавливаем зависимости из файла requirements.txt
RUN pip install -r requirements.txt

# Обновляем список пакетов и устанавливаем Git
RUN apt-get update && apt-get install -y git

# Копируем текущий каталог в рабочий каталог
COPY . .

# Отменяем все изменения в репозитории Git
RUN git stash

# Переходим на ветку v2.0 в репозитории Git
RUN git checkout v2.0

# Устанавливаем переменную окружения FLASK_APP для работы с Flask
ENV FLASK_APP=backend1

# Открываем порт 5000 для работы с приложением
EXPOSE 5000

# Устанавливаем команду для запуска приложения
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
