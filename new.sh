#! /bin/bash

id=$(openssl rand -hex 3)
hugo new --kind $1 posts/$1-$id.org
