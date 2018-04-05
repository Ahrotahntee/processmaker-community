FROM ahrotahntee/nginx-php5:latest
RUN apk update && apk add php5-mysqli php5-xml php5-mcrypt php5-soap php5-ldap php5-gd php5-curl php5-ctype openssl php5-mysql php5-xml php5-dom php5-openssl php5-pdo php5-json php5-pdo_mysql
ADD processmaker/ /srv
ADD default.conf /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx -R /srv && chmod 770 /srv/shared && cd /srv/workflow/engine && chmod 770 config content/languages plugins xmlform js/labels
WORKDIR "/srv/workflow/engine"
VOLUME "/srv"
