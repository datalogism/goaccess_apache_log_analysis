#!/bin/bash

# Directory where to store GoAccess reports (typically exposed by a web server)
export PUBLIC_HTML_DIR=/home/user/public_html

# Corresponding URL
export PUBLIC_HTML_URL=http://yourserver.org/~user

# File name of the html reports
export HTML_REPORT=apache_report.html
export HTML_REPORT_NOBOT=apache_report_nobot.html

# Apache logs
export APACHE_HISTORY_LOGS=/var/log/apache2/access.log.*
export APACHE_CURRENT_LOG=/var/log/apache2/access.log

# GoAccess binary
export GOACCESS_BIN=/usr/local/bin/goaccess

# GoAccess database
export GOACCESS_DBPATH=/tmp/goaccess
export GOACCESS_DBPATH_NOBOT=/tmp/goaccess_nobot
