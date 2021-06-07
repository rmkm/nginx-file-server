FROM nginx:latest

ARG key_directory="/etc/nginx/ssl"

# backup default config files
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bkup
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bkup
# create directory for media files
RUN mkdir /usr/share/nginx/html/media
# copy custom conf file to container
COPY custom.conf /etc/nginx/conf.d/

# generate key and cert
RUN mkdir ${key_directory}
RUN openssl genrsa -out ${key_directory}/nginx.key 3072
RUN openssl req -new -key ${key_directory}/nginx.key -out ${key_directory}/nginx.csr -subj "/CN=example.com"
RUN openssl x509 \
    -req \
    -in ${key_directory}/nginx.csr \
    -days 36500 \
    -signkey ${key_directory}/nginx.key > ${key_directory}/nginx.crt

