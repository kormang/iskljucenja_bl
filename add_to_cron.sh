#! /bin/bash

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SEARCH_TERM=$1
(crontab -l 2>/dev/null; echo "30 8 * * * XDG_RUNTIME_DIR=/run/user/$(id -u) $DIR/iskljucenja_bl.sh \"$SEARCH_TERM\"") | crontab -
(crontab -l 2>/dev/null; echo "0 16 * * * XDG_RUNTIME_DIR=/run/user/$(id -u) $DIR/iskljucenja_bl.sh \"$SEARCH_TERM\"") | crontab -
(crontab -l 2>/dev/null; echo "45 22 * * * XDG_RUNTIME_DIR=/run/user/$(id -u) $DIR/iskljucenja_bl.sh \"$SEARCH_TERM\"") | crontab -

