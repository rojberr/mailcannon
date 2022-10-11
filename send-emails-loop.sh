#!/bin/bash

i=0;

while true;
do
    (( i=i+1 ));
    swaks -s "${RECIPIENT_IP}" -p "${RECIPIENT_PORT}" -t "${RECIPIENT_MAIL}" -f "${SENDER_MAIL}" -h-Subject "${EMAIL_SUBJECT}";
    echo "Mail $i";
    sleep 0.05;
done