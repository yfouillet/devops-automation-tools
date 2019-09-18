FROM alpine:3.9

ENV ANSIBLE_VERSION "2.8.4"
ENV ANSIBLE_LINT_VERSION "4.1.0"
ENV PACKER_VERSION="1.2.4"

ENV USER_NAME agent-user
ENV USER_GROUP agent-user

ARG UID=10000
ARG GID=10000

RUN addgroup -S $USER_GROUP -g $GID
RUN adduser -S -G $USER_GROUP $USER_NAME -u $UID

RUN apk --update --no-cache add \
        ca-certificates \
        python3 \
	terraform \
	curl \
	git \
	docker \
	openrc
		
RUN curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o packer_${PACKER_VERSION}_linux_amd64.zip 
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/bin \
 && rm -rf packer_${PACKER_VERSION}_linux_amd64.zip
 
RUN apk --update --no-cache add --virtual \
        .build-deps \
        python3-dev \
        libffi-dev \
        openssl-dev \
        build-base \
 && pip3 --no-cache-dir install --upgrade \
        pip \
 && pip3 --no-cache-dir install \
        jinja2 \
		ansible==${ANSIBLE_VERSION} \
        ansible-lint==${ANSIBLE_LINT_VERSION} \
	molecule \
 && apk del \
        .build-deps \
		curl
		
RUN rm -rf /var/cache/apk/* \
 && rm -rf ~/.cache/pip \
 && find  -name '/__pycache__' -exec rm -rf {} \;
RUN mkdir -p /workspace/

RUN addgroup $USER_NAME docker
RUN rc-update add docker boot

USER $USER_NAME

WORKDIR /workspace
CMD ["/bin/sh"]
