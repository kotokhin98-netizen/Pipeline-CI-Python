FROM python:3.11-slim

WORKDIR /app

# Копируем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект
COPY . .

# Устанавливаем пакет
RUN pip install -e .

# Устанавливаем PYTHONPATH и запускаем
ENV PYTHONPATH=/app
CMD ["python", "-c", "from myapp.app import main; main()"]