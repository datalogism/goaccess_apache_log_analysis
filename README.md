# Analyze Apache logs with GoAccess

This repo provides simple tools that use the [GoAccess](https://goaccess.io/) web log analyzer to generate reports on the traffic of an Apache server, either on CentOS or Ubuntu. It can be adapted easily to other Linux distributions.


## Scripts

### run_goaccess.sh

It first analyzes the log history (typically files `/var/log/httpd/access_log-*` on a CentOS, `/var/log/apache/access.log*` on an Ubuntu server) and persists the result.

Then, it appends the current log file and runs GoAccess in on-the-flow daemon mode.

For the webpage to be updated dynamically, GoAccess opens a WebSocket server on port 7890. Therefore, you may need to configure your firewall to allow port 7890 to be accessed from outside your seerver.

### run_goaccess_nobot.sh

Builds a static report (no on-the-flow mode) after removing from the log history 
all the lines corresponding to queries made by web crawlers (bots).

Filtering is based on the bots' user agents provided by https://github.com/monperrus/crawler-user-agents.


## Installation 

### Dependencies

First install the following dependencies:
- [jq](https://stedolan.github.io/jq) command line JSON processor
- [GoAccess dependencies](https://github.com/allinurl/goaccess#distribution-packages): ncurses-devel, geoip, geoip2, ssl dev

For CentOS/Fedora this should look like this:
```bash
yum install jq ncurses-devel geoip-devel libmaxminddb-devel openssl-devel
```

For Ubuntu this should look like this:
```bash
apt install jq libncurses5-dev libncursesw5-dev libgeoip-dev libmaxminddb-dev libssl-dev
```

Then install [GoAccess](https://github.com/allinurl/goaccess) following the install procedure **from the source code**. Do not install it with apt-get (Debians) or yum (Redhats) as those versions are not up to date (at the time of writing).

It should be possible to have it work with the Docker distribution although adjusting shared volumes is quite tricky.

### Adapt to your environment

Simply update the variables in the env_*.sh file that most closely maches your OS.


