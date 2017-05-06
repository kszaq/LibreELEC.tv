#!/bin/sh
case "$1" in
   post)
     /usr/bin/systemctl restart bluetooth.service
     ;;
esac
