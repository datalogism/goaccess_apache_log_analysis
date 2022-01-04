#!/bin/bash

. $PWD/env.sh
mkdir -p $GOACCESS_DBPATH

REPORT_OUTPUT=$PUBLIC_HTML_DIR/$HTML_REPORT

# Analyze log history and persist the result
$GOACCESS_BIN \
  $APACHE_HISTORY_LOGS \
  --log-format=COMBINED \
  --db-path $GOACCESS_DBPATH \
  --persist \
  --output $REPORT_OUTPUT

echo "Check report at $PUBLIC_HTML_URL/$HTML_REPORT."
