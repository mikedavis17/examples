#!/usr/bin/env python3

"""
Functions for making or plotting a histogram for a seqeunce.
"""

def histogram(seq) :
    """Count the number of times each value appears in the input.

    SEQ is any iterable.  

    Returns a dictionary where the keys are the distinct items in 
    the input and the values are the counts.
    """

    values = {}
    for k in seq :
        if k not in values :
            values[k] = 1
        else :
            values[k] = values[k] + 1

    return values


def plot(seq) :
    """Make an ASCII plot of the histogram of a sequence.

    SEQ is any iterable.
    """

    if len(seq) == 0 :
        print ("No values to plot")
        return
    
    values = histogram(seq)

    t = max([v for v in values.values()])
    t /= 60.0
    print ("* =", t, "units")
    for (k,v) in values.items() :
        pk = str(k)[:8]
        pv = '*' * int(0.5+v/t) #"*" * 
        print ("{0:>8}: {1}".format(pk, pv))
        
