ARG FROM_ARCH=amd64
ARG FROM_VARIANT=1-alpine

# Final Docker image
FROM $FROM_ARCH/ruby:$FROM_VARIANT

LABEL description="Ruby server"
LABEL version="0.0.9"
LABEL repository="https://github.com/Ekristoffe/test/"
LABEL website="https://www.ruby-lang.org/en/"

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
	&& apk add --no-cache sqlite-dev

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

WORKDIR /usr/src/app
# User configuration directory volume

EXPOSE 60000

CMD ["ruby", "-C", "/usr/src/app/server", "svm.rb"]
