#!/usr/bin/python

seen = set()
start = 0

integers = [int(line) for line in open("input").readlines()]
integer_len = len(integers)

i = 0

while start not in seen:
    if i >= integer_len:
        print "resetting i"
        i = 0
    seen.add(start)
    start += int(integers[i])
    i += 1

print start
