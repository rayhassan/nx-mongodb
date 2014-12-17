# Very basic/default mongodb 2.6.5 (x64) install for testing only.

FROM centos:centos6

MAINTAINER "ray hassan" ray@nutanix.com

RUN groupadd mongod
RUN useradd mongod -g mongod 

COPY mongodb.repo /etc/yum.repos.d/mongodb.repo 
RUN yum update -y yum  && yum install -y mongodb-org sudo

EXPOSE 27017

RUN mkdir /data/db
RUN chown -R mongod:mongod /var/lib/mongo
RUN chown -R mongod:mongod /var/log/mongo

USER mongod
WORKDIR /home/mongod

ENTRYPOINT usr/bin/mongod
