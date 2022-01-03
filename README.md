# Analyze Apache logs with GoAccess

This repo provides simple tools that use the [GoAccess](https://goaccess.io/) web log analyzer to generate reports on the traffic of an Apache server.

It comes with configurations for common installations of Apache on CentOS and Ubuntu. It can be adapted easily to other Linux distributions.


## Scripts

Two environment files are provided for common Apache deployement paths: `env_centos.sh` or `env_ubuntu.sh`.
Create file `env.sh` by copying or making a symbolic link to one of them and update the variables to reflect your environment specificities.

Two sets of scripts are provided:
- `run_goaccess_init.sh` and `run_goaccess.sh`: analyze the Apache logs without further processing
- `run_goaccess_norobot_init.sh` and `run_goaccess_norobot.sh`: : analyze the Apache after filtering out the queries issued by well-known web crawlers (bots).

Web crawlers filtering is based on the bots' user agents provided by https://github.com/monperrus/crawler-user-agents.


### `run_goaccess_init.sh` and `run_goaccess_norobot_init.sh`

They analyze the log **history** (typically files `/var/log/httpd/access_log-*` on a CentOS, `/var/log/apache/access.log*` on an Ubuntu server) and persist the result in a new database.

They should be run only once, or whenever you want to re-generate the GoAccess database.

### `run_goaccess.sh` and `run_goaccess_norobot.sh`

These process the current log file (typically files `/var/log/httpd/access_log` on a CentOS, `/var/log/apache/access.log` on an Ubuntu server) and run GoAccess to append the analysis to previously analyzed logs.

`run_goaccess_norobot.sh` first removes from the log file all the lines corresponding to queries made by web crawlers (bots).

Typically, they should be run once a day using a cron job.
Adapt the run frequency depending on the Apache log management policy (usually enforced by logrotate).


## Installation and usage

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

Create file `env.sh` by copying or making a symbolic link to the one closer to your environment: `env_centos.sh` or `env_ubuntu.sh`

And simply update the variables according to the in accordance with your environment.
