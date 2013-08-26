#!/usr/bin/env python3

from math import sqrt, hypot

def gcd( i, j ) :
    if ( i > j ) :
        i,j = j,i
    while i > 0 :
        i,j = j%i,i
    return j

if __name__ == '__main__' :
    print (gcd( 4, 5 ))
    print (gcd( 8, 6 ))
    print (hypot( 41, 46 ))
    
