FROM python:3.11-slim
WORKDIR /app

COPY backend ./backend
RUN pip install -r backend/requirements.txt

RUN apt-get update && apt-get install -y nodejs npm

COPY frontend ./frontend
RUN cd frontend && npm install && npm run build

COPY deploy/start.sh ./start.sh
RUN chmod +x start.sh

CMD ["./start.sh"]
