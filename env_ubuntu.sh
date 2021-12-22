#!/bin/bash

# Directory where to store GoAccess reports (typically exposed by a web server)
PUBLIC_HTML_DIR=/home/fmichel/public_html

# Corresponding URL
PUBLIC_HTML_URL=http://prod-covidweb-dbpedia.inria.fr/~fmichel

# Apache logs
APACHE_HISTORY_LOGS=/var/log/apache2/unziped/access.log.*
APACHE_CURRENT_LOG=/var/log/apache2/access.log

# GoAccess binary
GOACCESS_BIN=/usr/local/bin/goaccess