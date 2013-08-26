#!/usr/bin/env python3

"""Generate pythagorean triples and display some."""

from itertools import *
from math import sqrt,hypot
from gcd import gcd
from operator import itemgetter

def triples( max ) :
    """Generate a list of all prime pythagorean triples in range.

    MAX is the largest value of the hypotenuse to allow.
    """
    for i in range( 1, max ) :
        for j in range ( i+1, max ) :
            k = hypot( i, j )
            if k < max and k == int( k ) and 1 == gcd( i, j ):
                yield ( i, j, int(k) )
    

def main(max) :
    """Print all pythagorean triples that can be created more than one way.

    For example, 16^2 + 63^2 = 33^2 + 56^2 = 65^2.

    MAX is the largest value of the hypotenuse to allow.
    """
    
    tr = sorted( list( triples( max ) ), key=itemgetter(2) )
    #print (tr)

    tr2 = [ p for h,p in
            [ ( k, list( g ) ) for k,g in groupby( tr, lambda t: t[2] ) ]
            if len( p ) > 1 ]
    print (tr2)


if __name__ == '__main__' :
    main(100)
