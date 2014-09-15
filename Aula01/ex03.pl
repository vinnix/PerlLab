#!/bin/env perl
#
#
#
$resposta = 42; # inteiro
$pi = 3.14159265; # real
$avocado = 6.02e23; # notação científica
$mil = 1e3; # notação científica de novo
$terraqueos = 6_200_000_000; # separador de milhar
$n1 = 023; # octal para 19
$n2 = 0xA9; # hexadecimal para 169
$n3 = 0b11111111; # binário para 255
$bolas = "234"; # como texto

print $resposta, ' ', $pi, ' ', $avocado, ' ', $mil, ' ',
 $terraqueos, ' ', $n1, ' ', $n2, ' ', $n3, "\n";
print $bolas + 1, "\n";
