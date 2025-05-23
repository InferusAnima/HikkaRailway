FROM python:3.9 as main
ENV RAILWAY=true
ENV DOCKER=true
ENV GIT_PYTHON_REFRESH=quiet
ENV PIP_NO_CACHE_DIR=1
RUN apt update && apt install libcairo2 git -y --no-install-recommends
RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp/*
RUN git clone https://github.com/hikariatama/Hikka /Hikka
WORKDIR /Hikka
RUN pip install -U setuptools
RUN pip install --no-warn-script-location --no-cache-dir -r requirements.txt
RUN pip install --no-warn-script-location --no-cache-dir redis
EXPOSE 8080
RUN mkdir /data
CMD ["python3", "-m", "hikka"]
