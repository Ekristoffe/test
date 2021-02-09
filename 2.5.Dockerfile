ARG FROM_ARCH=amd64
ARG FROM_VARIANT=2.5-alpine

# Multi-stage build, see https://docs.docker.com/develop/develop-images/multistage-build/
FROM alpine AS builder

ENV VERSION 0.1.1

# Download QEMU, see https://github.com/ckulka/docker-multi-arch-example
ADD https://github.com/balena-io/qemu/releases/download/v5.2.0%2Bbalena4/qemu-5.2.0.balena4-arm.tar.gz .
RUN tar zxvf qemu-5.2.0.balena4-arm.tar.gz --strip-components 1
ADD https://github.com/balena-io/qemu/releases/download/v5.2.0%2Bbalena4/qemu-5.2.0.balena4-aarch64.tar.gz .
RUN tar zxvf qemu-5.2.0.balena4-aarch64.tar.gz --strip-components 1

# Final Docker image
FROM $FROM_ARCH/ruby:$FROM_VARIANT

LABEL description="Ruby server test"
LABEL version="0.1.1"
LABEL repository="https://github.com/Ekristoffe/test/"
LABEL website="https://www.ruby-lang.org/en/"

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin
COPY --from=builder qemu-aarch64-static /usr/bin

# update apk
#RUN apk update \ 
	# upgrade the system
RUN apk upgrade --no-cache \ 
	# add make
	&& apk add --no-cache make \ 
	# add gcc, binutils, isl, libgomp, libatomic, mpfr3, mpc1
	&& apk add --no-cache gcc \ 
	# add libc-dev, musl-dev
	&& apk add --no-cache libc-dev \ 
	# add g++
	&& apk add --no-cache g++ \ 
	# add sqlite
	&& apk add --no-cache sqlite \ 
	# add sqlite-dev, sqlite-libs
	&& apk add --no-cache sqlite-dev \
	# add tzdata
	&& apk add --no-cache tzdata

# Clean APK cache
RUN rm -rf /var/cache/apk/*

# update current gem
RUN gem update -N

# add macaddr, systemu
RUN gem install -N macaddr \ 
	# add em-websocket, http_parser.rb, eventmachine
	&& gem install -N em-websocket \ 
	# add mail, mini_mime
	&& gem install -N mail \ 
	# add rmodbus
	&& gem install -N rmodbus \ 
	# add serialport
	&& gem install serialport \ 
	# add faraday, multipart-post
	&& gem install -N faraday \ 
	# add faye-websocket, websocket-extensions, websocket-driver
	&& gem install -N faye-websocket \ 
	# add sqlite
	&& gem install -N sqlite3 \ 
	# add zip
	&& gem install -N zip

WORKDIR /usr/local/app
# User configuration directory volume

EXPOSE 60000

# Add a healthcheck (default every 30 secs)
HEALTHCHECK --interval=60s --timeout=10s --start-period=60s --retries=3 CMD ["ruby", "-C", "/usr/local/app/server", "healthcheck.rb"]

CMD ["ruby", "-C", "/usr/local/app/server", "svm.rb"]
