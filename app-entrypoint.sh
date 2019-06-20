#!/bin/bash

alembic upgrade head

uwsgi --ini app.ini
