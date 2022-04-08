#!/bin/bash

LANG=C.UTF-8
SCREEN_WHD="${SCREEN_WHD:-1440x900x16}"


Xvfb :20 -screen 0 "${SCREEN_WHD}" &
sleep 1
x11vnc -display :20 -forever -bg -o "/tmp/x11vnc.log"
sleep 1
DISPLAY=:20 fluxbox -log /tmp/fluxbox.log &
sleep 1
# openssl req -new -x509 -days 365 -nodes -out root.crt -keyout root.key
novnc_proxy --vnc localhost:5900 --listen 0.0.0.0:6080 --cert /app/ssl/root.crt  --key /app/ssl/root.key &
sleep 1

yarn
DISPLAY=:20 yarn cypress open --browser chrome

# yarn cypress run --env allure=true,allureResultsPath=results/allure -s cypress/integration/todo.spec.js
# allure serve -h 0.0.0.0 -p 1806 ./results/allure
wait
