FROM alpine:edge
RUN apk add --no-cache bash gcc musl-dev libc-dev libpng-dev libjpeg-turbo-dev

RUN cd /usr/local && \
    wget http://dl.suckless.org/farbfeld/farbfeld-2.tar.gz && \
    tar -zxvf farbfeld-2.tar.gz && \
    mv farbfeld-2 farbfeld

# Using make doesn't work for me, so just compile each file
RUN cd /usr/local/farbfeld && \
    mkdir bin && \
    cc png2ff.c -o ./bin/png2ff -lpng  && \
    cc ff2png.c -o ./bin/ff2png -lpng && \
    cc jpg2ff.c -o ./bin/jpg2ff -ljpeg

ENV PATH="/usr/local/farbfeld/bin:${PATH}"

RUN mkdir /data
WORKDIR /data
