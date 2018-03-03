#!/bin/env perl
#
use warnings;
#use strict;


open(ALVO, "alvo.txt") or die "Falhou: $!\n";
chop(@alvo = <ALVO>);
while (1) {
	print "Informe algo para procurar: ";
	chop($pad = <>);
	last unless $pad;
	for ($i = 0; $i < @alvo; $i++) {
		print "$i: ", $alvo[$i], "\n" if ($alvo[$i] =~ /$pad/);
	}
}

