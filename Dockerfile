FROM alpine
RUN apk --update add curl
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN curl -s https://allmark.io/bin/files/allmark_linux_amd64 > /usr/local/bin/allmark && chmod +x /usr/local/bin/allmark
WORKDIR /markdown
RUN curl -L -s https://github.com/qdm12/personal.md/archive/master.tar.gz | tar zx --strip-components=1
RUN apk del curl --purge
ENTRYPOINT allmark serve