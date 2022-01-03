#!/bin/bash

. env.sh
mkdir -p $GOACCESS_DBPATH_NOROBOT


# Get the list of bots' user agents..."
useragents_json=/tmp/useragents.json
useragents_list=/tmp/useragents_list.txt
curl --output $useragents_json https://raw.githubusercontent.com/monperrus/crawler-user-agents/master/crawler-user-agents.json
jq --raw-output '.[]|.pattern' $useragents_json > $useragents_list
echo "Retrieved $(wc -l $useragents_list | cut -d' ' -f1) bots' user agents."

# Group all log history files
logfile=/tmp/access_log
cat $APACHE_HISTORY_LOGS > $logfile
echo "Log history contains $(wc -l $logfile | cut -d' ' -f1) lines."

# Filter the log to remove queries coming from bots
logfile_nobot=/tmp/access_log_nobot
cat $logfile | grep --file=$useragents_list --invert-match > $logfile_nobot
echo "Filtered log contains $(wc -l $logfile_nobot | cut -d' ' -f1) lines."


# Analyze log history and persist the result
REPORT_OUTPUT=$PUBLIC_HTML_DIR/$HTML_REPORT_NOBOT
$GOACCESS_BIN \
  $logfile_nobot \
  --log-format=COMBINED \
  --db-path $GOACCESS_DBPATH_NOROBOT \
  --persist \
  --output $REPORT_OUTPUT

echo "Check report at $PUBLIC_HTML_URL/$HTML_REPORT_NOBOT."
