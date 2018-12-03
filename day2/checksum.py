#!/usr/bin/python

start = 0

def charAppearsNum(num, string):
    seen = {}
    for c in string:
        if c not in seen:
            seen[c] = 0
        seen[c] += 1
    for k in seen:
        if seen[k] == num:
            return True
    return False

def hammingDistance(s1, s2):
    return sum ([0 if s1[i] == s2[i] else 1 for i in range(len(s1))])

if __name__ == '__main__':

    num_twice = 0
    num_thrice = 0
    for line in open("input").readlines():
        print line
        twice = charAppearsNum(2, line.strip())
        thrice = charAppearsNum(3, line.strip())
        if twice:
            num_twice += 1
        if thrice:
            num_thrice += 1

    print num_twice * num_thrice
