# nginx-docker
nginx app proxy docker
 
usage:

```
    docker run -d -e PORT=$APPLICATION_PORT -e APPLICATION_LINK=$APPLICATION_LINK -v /etc/letsencrypt:/etc/letsencrypt -h $VM_HOSTNAME -p 80:80 -p 443:443 --link some_application:$APPLICATION_LINK coinpit/nginx-docker    
    
```
