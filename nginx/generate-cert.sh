#!/usr/bin/env bash

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cert/nginx-selfsigned.key -out cert/nginx-selfsigned.crt

sudo openssl dhparam -out cert/dhparam.pem 128

