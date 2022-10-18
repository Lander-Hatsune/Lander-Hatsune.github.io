#! /bin/bash

id=$(openssl rand -hex 3)
hugo new post/$1-$id.org
