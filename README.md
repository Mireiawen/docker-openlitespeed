Simple [OpenLiteSpeed](https://openlitespeed.org/) container running on [MiniDeb](https://github.com/bitnami/minideb), intended to be used as base image for OpenLiteSpeed based applications. It includes PHP 7.3 and PHP 7.4, and PHP 7.3 has been set as default.

## Running

To start the container, just run something like the following:
```
docker 'run' \
	--detach \
	--rm \
	--env 'ADMIN_PASSWORD=secret' \
	--name 'openlitespeed' \
	--publish '80:80' \
	--publish '7080:7080' \
	'mireiawen/openlitespeed'
```

To set the webadmin password, use the environment variable `ADMIN_PASSWORD` to set it.

The container has 2 ports exposed, the HTTP port and the Web Admin interface running HTTP on 7080.

The container uses 3 volumes:
* `/tmp/lshttpd` for temporary files
* `/var/log/litespeed` for log files
* `/var/www/container` for the web files

The public files are under the path `/var/www/container/web` and the service is run as `www-data` user and group.

There is simple health check checking that the OpenLiteSpeed server is running, but it does not do anything else. The server error logs are printed to the `stdout`, but access logs have to be fetched from the file.
