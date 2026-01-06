FROM python:3.11-alpine

WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create non-root user
RUN addgroup -g 1001 appuser && \
    adduser -D -u 1001 -G appuser appuser

COPY app/ .

# Grant capability to bind to port 80 without root
RUN apk add --no-cache libcap && \
    setcap 'cap_net_bind_service=+ep' /usr/local/bin/python3.11

USER appuser

EXPOSE 80

CMD ["python", "main.py"]
