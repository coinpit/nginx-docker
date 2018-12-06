FROM ubuntu:xenial

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates nginx
RUN rm -rf /var/lib/apt/lists/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && mkdir src

COPY site-https.in *.sh src/
RUN cd src; chmod +x *.sh
EXPOSE 80 443
VOLUME ["/var/cache/nginx"]

CMD cd src; ./run.sh; cat /etc/nginx/sites-enabled/site-https
