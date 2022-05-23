FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
 apt-get -y install

COPY assignment_04.sh /usr/bin

RUN ["chmod", "+x", "/usr/bin/assignment_04.sh"]

ENTRYPOINT ["/usr/bin/assignment_04.sh"]
