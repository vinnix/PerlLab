#!/bin/env perl
#
#
#

use warnings;

print @sasioc = ("Copo ", "Vela ", "Caneta "), "\n\n";
print splice(@sasioc, 0, 1), "\n"; # extrai o primeiro
print "Sobram: ", @sasioc, "\n\n";

print splice(@sasioc, $#sasioc, 1), "\n"; # extrai o último
print "Sobram: ", @sasioc, "\n\n";
splice(@sasioc, 0, 0, "Quadro "); # # insere no começo
print "Resulta: ", @sasioc, "\n\n";
splice(@sasioc, $#sasioc + 1, 0, "Cadeira "); # insere no fim
print "Resulta: ", @sasioc, "\n\n";
splice(@sasioc, 5, 0, 'Sapato'); # insere além do fim
print "Resulta: ", @sasioc, "\n\n";
#
