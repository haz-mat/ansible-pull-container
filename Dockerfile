FROM alpine:latest

ENV ANSIBLE_VERSION=2.1.4.0

ENTRYPOINT ["ansible-pull"]

RUN echo 'Install Ansible' \
    && apk add --virtual .build-dependencies --update --no-cache --verbose \
        build-base \
        python-dev \
        libffi-dev \
        openssl-dev \
        py-pip \
    && apk add --update --no-cache --verbose \
        git \
        python \
        py-setuptools \
        openssh-client \
        rsync \
    && pip install --upgrade pip \
    && pip install ansible==${ANSIBLE_VERSION} \
    && mkdir /etc/ansible \
    && apk del .build-dependencies
