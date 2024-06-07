FROM python:3.12-alpine
LABEL autors='Leha!'
WORKDIR /usr/src/app

# Не позволяет Python копировать файлы .pyc в контейнер
ENV PYTHONDONTWRITEBYTECODE 1
# Гарантирует, что вывод Python регистрируется в терминале, что позволяет отслеживать логи FastAPI в режиме реального времени
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY . .
RUN pip install -r requirements.txt

#EXPOSE 8000
CMD uvicorn main:app --host 0.0.0.0 --port 80