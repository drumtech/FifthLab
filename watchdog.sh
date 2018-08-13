#!/bin/bash
ps -A | grep postgres || /etc/init.d/postgresql restart