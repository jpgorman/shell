#!/bin/sh

simple_function()
{
  FIRST=$1
  SECOND=$2
  shift;shift;
  REST=$@
  echo "Called simple_function"
  echo "Called with ${FIRST} and ${SECOND}"
  echo "Rest of args are ${REST}"
}

echo "Starting script"
simple_function foo bar baz
