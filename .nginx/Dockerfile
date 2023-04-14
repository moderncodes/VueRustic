FROM nginx:stable

COPY ./sites-available/dev.conf /etc/nginx/conf.d/dev.conf
COPY ./sites-available/prod.conf /etc/nginx/conf.d/prod.conf
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]