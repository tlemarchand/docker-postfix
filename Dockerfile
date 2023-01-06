FROM debian:bullseye-slim

COPY version /tmp/

RUN apt-get update && apt-get install -y postfix=`cat /tmp/version` postfix-ldap

CMD postfix start-fg