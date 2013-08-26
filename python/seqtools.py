#!/usr/bin/env python3

"""
functions for creating sequences from other sequences

Note: Many of these can be better implemented by functions from the 
      itertools library.
"""

def chunker(seq, n) :
    """Create a new sequence of N sized chunks of SEQ.

    SEQ is any iterable.
    N   is the number of items to pull from SEQ for each chunk.

    The last chunk may be shorter than N.
    """
    s = iter(seq)
    more = True
    items = [s for s in seq]

    while len(items) > 0 :
        v = items[:n]
        items = items[n:]
        yield list(v)

def agg_seq(seq, n, agg) :
    """Create a new sequence by applying AGG to N-sized chunks of SEQ.
    
    SEQ is any iterable.
    N   is the number of items to pull from SEQ for each chunk.
    AGG is any callable which will take an element of SEQ.
    """


    for x in chunker(seq, n) :
        yield agg(x)

def flatten(seqs) :
    """Recursively transform a sequence of sequences it into a sequence.

    SEQS is any sequence.
    """

    for s in seqs :
        if type(s) == str :
            yield s
        else :
            try :
                x = iter(s)
                for v in flatten(x) :
                    yield v
            except TypeError as e :
                yield s

def bestof(seq,n,k) :
    """Sort chunks of a sequence and return a subset of each chunk.

    SEQ is any iterable.
    N   is the number of items to pull from SEQ for each chunk.
    K   is the number of items to return from each chunk.

    Each chunk of N items is sorted and the largest (by the sort)
    K items are returned.
    """
    for s in chunker(seq, n) :
        yield sorted(s)[-k:]

if __name__ == '__main__' :
    import random
    print (list(chunker(range(5), 3)))
    print (list(chunker(range(100), 10)))
    print (list(agg_seq(range(100), 10, lambda x : sum(x[:2]))))
    print (list(flatten([range(3), 3.14159, range(2)])))
    print (list(flatten(['testing'])))
    x = list(range(100))
    random.shuffle(x)
    print (list(bestof(x, 10, 2)))

    print ('OK, that went well')

