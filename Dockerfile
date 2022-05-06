FROM alpine
LABEL maintainer "Patrick D'appollonio <patrick@dappollonio.us>"

# Env setup
ENV PACKER_VERSION=1.8.0 \
    PACKER_OSNAME=linux \
    PACKER_OSARCH=amd64 \
    PACKER_DEST=/usr/local/sbin

# Packer path setup
ENV PACKER_ZIPFILE=packer_${PACKER_VERSION}_${PACKER_OSNAME}_${PACKER_OSARCH}.zip

# Install packer in path
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/${PACKER_ZIPFILE} ${PACKER_DEST}/
RUN unzip ${PACKER_DEST}/${PACKER_ZIPFILE} -d ${PACKER_DEST} && \
    rm -rf ${PACKER_DEST}/${PACKER_ZIPFILE}

RUN apk add qemu qemu-img qemu-system-x86_64 qemu-ui-gtk
