#!/usr/bin/python

def hammingDistance(s1, s2):
    return sum ([(0 if s1[i] == s2[i] else 1) for i in range(len(s1))])

if __name__ == '__main__':

    lines = [l.strip() for l in open("input").readlines()]
    lines_len = len(lines)
    correct_ids = []
    for i in xrange(lines_len):
        for j in xrange(i, lines_len):
            if hammingDistance(lines[i], lines[j]) == 1:
                correct_ids.append(lines[i])
                correct_ids.append(lines[j])
                break
    print correct_ids
    correct = ""
    for i in xrange(len(correct_ids[0])):
        if correct_ids[0][i] != correct_ids[1][i]:
            continue
        correct += correct_ids[0][i]
    print correct


