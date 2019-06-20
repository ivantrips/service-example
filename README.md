# Flask Example Project

## Quick Start

### First Steps
Make sure you generate and install the certificate of **localhost** in your computer in order for **HTTPS** to work which is described [here](nginx/README.md)
```sh
$ docker-compose build
$ docker-compose up
```
visit [https://localhost](https://localhost)
_NOTE: Usually RabbitMQ takes about 30 seconds to start, and the worked is dependant for that service, so the application wont work till RabbitMQ is ready_

## Dockerfile

I used Alpine because i wanted to keep the image light, just had one problem when i wanted to uninstall the **APK** dependencies, **uwsgi** fails so that's the reason i didnt use the flags:
- --no-cache
- --virtual

## Docker compose
The file contains 5 services

### Nginx
This service contains most of the work done described [here](nginx/README.md)

### APP
For the HTTP application i made sure the HTML generated has the path that i wanted in the following line
```python
application = Flask(__name__, static_folder = '/')
```
but probably is it better to serve the files under css/js/img directories but i left them in static as they were and also injected the Postgres URL using the `.env` file

Also the `app.ini` file contains the **uWSGI** configuration

`app-entrypoint.sh` is only a file for running migrations before starting the app

### Worker
Also i injected using the `.env` file the Broker URL for rabbitMQ and i used the same Dockerfile for both the **Worker** and **HTTP** Server

The entrypoint of the worker is just a plain python process

### RabbitMQ and PostgresSQL

I only added those services to the docker-compose file but i only configured environment variables for passwords and usernames

