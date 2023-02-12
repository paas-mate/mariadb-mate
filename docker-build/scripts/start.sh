#!/bin/bash

DIR="$( cd "$( dirname "$0"  )" && pwd  )"
bash -x $DIR/start-mariadb.sh
tail -f /dev/null
