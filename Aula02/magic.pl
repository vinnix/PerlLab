#!/bin/env perl
#
#
use warnings;
use strict;


open(HEADER, "> header.txt") or die "Falhou: $!.\n";
open(BODY, "> body.txt" ) or die "Falhou: $!.\n";
while (<>) {
	print HEADER $_ if 1 .. /^$/ ;
	print BODY $_ if /^$/ .. eof();
}
close HEADER;
close BODY;

