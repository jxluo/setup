#!/bin/bash

mkdir ~/.ssh && chmod go-rwx ~/.ssh
cd ~/.ssh
ssh-keygen -b 1024 -t rsa -f id_rsa -P ""
