FROM python:3-slim

WORKDIR /root

COPY requirements.txt ./
RUN pip install --user --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "zomboi.py" ]
