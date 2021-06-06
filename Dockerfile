FROM nginx:latest

# backup default config files
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bkup
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bkup

# create directory for media files
RUN mkdir /usr/share/nginx/html/media

# copy custom conf file to container
COPY custom.conf /etc/nginx/conf.d/
