#!/bin/env perl

use warnings;

open(LISTA, "find . -print |") || die "Falhou: $!\n";
ARQUIVO:
while ($arquivo = <LISTA>) {
	chop $arquivo;
	next ARQUIVO unless -T $arquivo;
	if (!open(TEXTO, $arquivo)) {
		print STDERR "Impossível abrir $arquivo, próximo...\n";
		next ARQUIVO;
	}
	while (<TEXTO>) {
		foreach $word (@ARGV) {
			if (index($_, $word) >= 0) {
				print $arquivo, "\n";
				next ARQUIVO;
			}
		}
	}
}
