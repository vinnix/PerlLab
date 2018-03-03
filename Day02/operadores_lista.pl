#!/bin/env perl
#
#
#
use warnings;

print @coisas = ("Copo ", "Vela ", "Caneta "), "\n\n";
print shift @coisas, "\n";
print "Sobram: ", @coisas, "\n\n";
print pop @coisas, "\n";
print "Sobram: ", @coisas, "\n\n";
print unshift(@coisas, "Quadro "), "\n";
print "Resulta: ", @coisas, "\n\n";
print push(@coisas, "Cadeira ", "Livro "), "\n";
print "Resulta: ", @coisas, "\n\n";
print $coisas[5] = "Sapato ", "\n"; # atribui além do fim
print "Resulta: ", @coisas, "\n\n";

