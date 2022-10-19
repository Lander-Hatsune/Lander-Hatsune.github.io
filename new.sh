#! /bin/bash

id=$(openssl rand -hex 3)
hugo new posts/$id.org
