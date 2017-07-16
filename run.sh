#!/usr/bin/env bash
#echo UPSTREAM_SERVER is $UPSTREAM_SERVER
#echo COINPIT_INT_IP is $COINPIT_INT_IP
[ ! -f /var/lib/nginx/params/dhparams.pem ] && openssl dhparam -out /var/lib/nginx/params/dhparams.pem 2048
#echo "$COINPIT_INT_IP     coinpitapp" >> /etc/hosts
eval echo "\"$(cat <<EOF
$(<site-https.in )
EOF
)\"" > /etc/nginx/sites-available/site-https

ln -sf  /etc/nginx/sites-available/site-https /etc/nginx/sites-enabled/site-https

nginx -g "daemon off;"
