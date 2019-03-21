FROM alpine:3.9

ENV ANSIBLE_VERSION "2.7.9"
ENV ANSIBLE_LINT_VERSION "3.4.23"
ENV PACKER_VERSION="1.2.4"
	  
RUN apk --update --no-cache add \
        ca-certificates \
        python3 \
	terraform \
	curl \
	git
		
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
 && apk del \
        .build-deps \
		curl
		
RUN rm -rf /var/cache/apk/* \
 && rm -rf ~/.cache/pip \
 && find  -name '/__pycache__' -exec rm -rf {} \;
RUN mkdir -p /workspace/

WORKDIR /workspace

CMD ["/bin/sh"]
