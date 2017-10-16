#!/bin/bash

pg_restore --no-acl --no-owner -a  -U airkemist -d airkemist_development /tmp/dumps/airkemist.dump
echo "DONE";
