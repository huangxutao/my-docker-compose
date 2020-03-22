#!/bin/bash

CONFIG_FILE=".config.yml"
TRAEFIK_FILE_PATH="./config/traefik/dynamic.yml"

echo -n "traefike user: "

read user

echo -n "traefike password: "

stty -echo

read password

echo -e "\n\n  ✅ traefik basicAuth user has been set, try \n      $ cat ${CONFIG_FILE}"

basicAuthInfo=`htpasswd -nb $user $password`


echo -e "\n\n👉 🛠️  please set to your traefik manually:\n
--------------------> ./config/traefik/dynamic.yml <------------------\n
     auth:
        basicAuth:
          users:
            - $basicAuthInfo

  ....
-----------------------------------------------------------------------\n
"

echo -e "user: $user\npassword: $password\nbasicAuthInfo: $basicAuthInfo" > $CONFIG_FILE
