#!/bin/sh

FILE="/home/lsaidi/data"
if [ ! -d "$FILE" ]; then
    mkdir -p ${FILE}/db
	mkdir -p ${FILE}/wp
fi