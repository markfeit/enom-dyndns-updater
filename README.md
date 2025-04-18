# eNOM Dynamic DNS Updater

This repository contains a script and crontab entry that can be used
to maintain a dynamic DNS address in a zone served by [eNOM's DNS
hosting service](https://www.enom.com/hosting/dns).

The host running the script does not need to be connected directly to
the Internet on a public-facing address; the
[ipify](https://www.ipify.org) service is used to determine the
outside address.


## Prerequisites

This script was will run in any environment that can provide the following:

 * A POSIX-compliant Bourne shell
 * A POSIX-compliant implementation of `logger`
 * The [cURL](https://curl.haxx.se) command-line interface

**Note that the `install` target in the Makefile uses Linux-specific commands.**


## Installation

Edit the configuration items at the top of the `Makefile` to suit your
installation.  (The defaults are fine on most Linux systems.)

`cp config.example config`

Edit `config` to set up the zone, host and password..

As `root`, execute `make install`.

As `root` execute `make install` a second time to make sure all
ownership and permissions are correct.
