#!/bin/bash

# Change the admin password but do not change the username
htpasswd -bd -c etc/users.passwd 'admin' 'admin'

# Add further users without -c option here or add them from the command-line
#htpasswd -bd etc/users.passwd 'user1' 'password1'
