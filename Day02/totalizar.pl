#!/bin/env perl
#
#
use strict;
use warnings;

&totalizar(10, 20, 30, 40);
&totalizar(1...100);

sub totalizar {
	my $tot = 0;
	$tot += $_ foreach @_;
	print "Total é $tot.\n";
}
