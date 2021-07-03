#!/bin/sh
HTML_FILES=`find ./ -name "*.sh" -print`
echo "$HTML_FILES" | grep "/while.sh$"
echo "$HTML_FILES" | grep "/talk.sh$"
