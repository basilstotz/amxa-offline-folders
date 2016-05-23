#
# Regular cron jobs for the amxa-offline-folders package
#
0 4	* * *	root	[ -x /usr/bin/amxa-offline-folders_maintenance ] && /usr/bin/amxa-offline-folders_maintenance
