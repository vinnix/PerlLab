#!/bin/env perl
#
#
use warnings;

srand; # inicializa a série randômica
@linhas = <>;
while (@linhas) {
	print splice(@linhas, rand @linhas, 1);
}

