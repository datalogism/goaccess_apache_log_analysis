#!/bin/bash

. ../env_ubuntu.sh

REPORT_OUTPUT=$PUBLIC_HTML_DIR/apache_report.html

# Analyze log history (files access_log-<date>) and persist the result
/usr/local/bin/goaccess \
  $APACHE_HISTORY_LOGS \
  --log-format=COMBINED \
  --persist \
  --output $REPORT_OUTPUT

# Then append the on-the-flow analysis of the current log file
$GOACCESS_BIN \
  $APACHE_CURRENT_LOG \
  --log-format=COMBINED \
  --real-time-html \
  --html-refresh=5 \
  --restore --persist \
  --output $REPORT_OUTPUT \
  --daemonize

echo "Check report at $PUBLIC_HTML_URL/apache_report.html."
