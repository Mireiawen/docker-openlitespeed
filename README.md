![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mireiawen/openlitespeed?style=plastic) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/mireiawen/openlitespeed/latest?style=plastic) [![GitHub](https://img.shields.io/badge/GitHub-Mireiawen%2Fdocker--openlitespeed-blueviolet?style=plastic)](https://github.com/Mireiawen/docker-openlitespeed)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FMireiawen%2Fdocker-openlitespeed.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FMireiawen%2Fdocker-openlitespeed?ref=badge_shield)

Simple [OpenLiteSpeed](https://openlitespeed.org/) container running on [MiniDeb](https://github.com/bitnami/minideb).

This container is  intended to be used as base image for OpenLiteSpeed based applications such as [WordPress](https://wordpress.org/) or [Drupal](https://www.drupal.org/). The container includes PHP 7.4 and it is set as the default handler for both LiteSpeed SAPI and the command line, and as such should be usable out of the box. 

The PHP extensions bundled with the LiteSpeed have been installed.

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

There is simple health check checking that the OpenLiteSpeed server is running, but it does not do anything else such as monitor any actual application output. The server error logs are printed to the `stdout`, but access logs have to be fetched from the file.


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FMireiawen%2Fdocker-openlitespeed.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FMireiawen%2Fdocker-openlitespeed?ref=badge_large)