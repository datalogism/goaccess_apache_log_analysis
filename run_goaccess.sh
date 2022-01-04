#!/bin/bash

. $PWD/env.sh
mkdir -p $GOACCESS_DBPATH

REPORT_OUTPUT=$PUBLIC_HTML_DIR/$HTML_REPORT

# Append the analysis of the current log file
$GOACCESS_BIN \
  $APACHE_CURRENT_LOG \
  --log-format=COMBINED \
  --db-path $GOACCESS_DBPATH \
  --restore --persist \
  --output $REPORT_OUTPUT

echo "Check report at $PUBLIC_HTML_URL/$HTML_REPORT."
