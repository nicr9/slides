FROM node:5.11-wheezy
MAINTAINER Nic Roland <nicroland9@gmail.com>

RUN apt-get install -y git
RUN npm install -g grunt-cli

WORKDIR /opt
RUN git clone https://github.com/hakimel/reveal.js.git

WORKDIR /opt/reveal.js
RUN npm install

ONBUILD ADD slides.html index.html

EXPOSE 8000
CMD ["grunt", "serve"]
