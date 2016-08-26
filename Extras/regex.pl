#!/bin/env perl

use strict;

my $inp = 'AAA * BBB CCC * * "2000 01 00 00 00" "2004 01 00 00 00"' ;

my @r;
while ($inp =~ /(
                    [^"\s]+
                |
                    "[^"]+?"
                )
                /gx) 
{
    my $a = $1;
    $a =~ s/(?:^"|"$)//g;
    push @r, $a;
}

print join "\n", @r, '';


# Trick / Challange
#
# * Use Text::CSV_XS
#   http://search.cpan.org/~hmbrand/Text-CSV_XS-1.24/CSV_XS.pm

