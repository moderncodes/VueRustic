#!/bin/sh

if [ "$APP_ENV" = "production" ]; then
    ln -sf /etc/nginx/conf.d/prod.conf /etc/nginx/conf.d/default.conf
else
    ln -sf /etc/nginx/conf.d/dev.conf /etc/nginx/conf.d/default.conf
fi

# Start Nginx in the foreground
exec nginx -g "daemon off;"