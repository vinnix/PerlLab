#!/bin/env perl 
#

print "Digite um hexadecimal: ";



$dado = <STDIN>; # Ao usar <STDIN> podemos fazer truques como:  $ echo 1000 | ./ex02.pl
                 # When using <STDIN> you can make tricks like: $ echo 1000 | ./ex02.pl 




print "Correspondente decimal: ", hex($dado), "\n";
#print STDOUT "Correspondente decimal: ", hex($dado), "\n";


