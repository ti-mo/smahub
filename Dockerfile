FROM alpine:3

# Prepare base system
RUN apk update && apk upgrade && \
    apk add python3 poetry git

# Install smahub
RUN mkdir -p /opt/smahub
WORKDIR /opt/smahub
COPY . /opt/smahub

RUN POETRY_VIRTUALENVS_CREATE=false poetry install

# Debug server port
EXPOSE 5678

ADD run_smahub.sh /root/
RUN chmod +x /root/*
ENTRYPOINT ["/root/run_smahub.sh"]
