#!/bin/bash

############
## CONFIG ##
############

# Services to check
services=(httpd mariadb)
# Your email address to receive email
email=""

# Check for programs
which systemctl > /dev/null

hostname=`hostname -f`

if [ $? != 0 ];
then
    echo "Command systemctl not found. Exit."
    exit;
fi

which mail > /dev/null

if [ $? != 0 ];
then
    echo "Command mail not found. Exit."
    exit;
fi

for service in "${services[@]}";
do
    echo -n "Checking $service... "

    systemctl --quiet is-active $service

    if [ $? != 0 ];
    then
        echo "Not active!"

        # Attempt to start the service
        echo "  Starting $service"
        systemctl start $service

        if [ $? = 0 ];
        then
            # Started successfully
            subject="[INFO] Restarted $service at $hostname"
            body="$service at $hostname wasn't running and has been started"

            echo "  Started $service successfully"
        else
            # Failed to start
            subject="[FATAL] Failed to start $service at $hostname"
            body="$service at $hostname wasn't running and failed to start!"

            echo "  Failed to start!"
        fi

        # Sends email to admin
        echo $body | mail -s "$subject" "$email"
    else
        echo "OK"
    fi
done
