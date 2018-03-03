#!/bin/env perl
#
#
$t = "texto";
$t .=  " mais um texto." ;
print  $t "\n";

$a = 10;
$b ;
$c ;

$c = $b = $a;  # TODOS 10
$c += 10;      # C == 20  # equivale a:  $c = $c + 10;
$b -= 5;       # B == 5   # equivale a:  $b = $b - 5;
print "$c , $b , $a \n";


