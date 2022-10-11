#!/bin/bash

i=0;

while true;
do
    (( i=i+1 ));
    swaks -s host.docker.internal -p 25 -t recipient@domain.com -f sender@jdr.test16.qm -h-Subject EMAIL_SUBJECT;
    echo "Mail $i";
    sleep 0.05;
done