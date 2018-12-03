#!/usr/bin/python

start = 0

for line in open("input").readlines():
    print line
    start += int(line)

print start
