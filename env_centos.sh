#!/bin/bash

# Directory where to store GoAccess reports (typically exposed by a web server)
PUBLIC_HTML_DIR=/home/fmichel/public_html

# Corresponding URL
PUBLIC_HTML_URL=https://sms.i3s.unice.fr/~fmichel

# Apache logs
APACHE_HISTORY_LOGS=/var/log/httpd/access_log-*
APACHE_CURRENT_LOG=/var/log/httpd/access_log

# GoAccess binary
GOACCESS_BIN=/usr/local/bin/goaccess