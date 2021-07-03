#!/bin/sh
echo "What is your name [ `whoami` ]"
read myname
echo "Your name is : '${myname:-`whoami`}'"

