FROM python:3-slim

WORKDIR /root

ARG TZ
ARG LC_ALL
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Seoul
ENV LC_ALL=ko_KR.UTF-8

# Timezone
RUN apt update && apt install -y --no-install-recommends --no-install-suggests \
    tzdata locales \
    && apt remove --purge --auto-remove -y

# locale
RUN locale-gen $LC_ALL

COPY requirements.txt ./
RUN pip install --user --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "zomboi.py" ]
