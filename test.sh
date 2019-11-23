#!/bin/bash

#if ! [ -x "$(command -v bash)" ]; then
#if [[ -d "$HOME/test folder" ]]; then
if [[ -z "$TEST" ]]; then
    echo "yes"
else
    echo "no"
fi
