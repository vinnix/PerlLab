#!/bin/env perl
#
#

$var = "CURSO;TESTE";

$var =~ s/^(.*)\;(.*)/$2 \; $1/g;

print $var;
