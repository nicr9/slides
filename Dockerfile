FROM node:5.11-wheezy
MAINTAINER Nic Roland <nicroland9@gmail.com>

RUN apt-get install -y git
RUN npm install -g grunt-cli

WORKDIR /opt
RUN git clone https://github.com/hakimel/reveal.js.git

WORKDIR /opt/reveal.js
RUN npm install

ADD index.html index.html
ADD open_source open_source
ADD groupie groupie
ADD openshift-authz openshift-authz

EXPOSE 8000
CMD ["grunt", "serve"]
