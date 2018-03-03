#!/bin/env perl
#
#
#
#
#
#
print "Nome do arquivo: ";
while (1) {
	chomp(my $f = <STDIN>);
	eval { open(ARQ, $f) or die "$f não abriu" };
	last unless $@;
	print $@, "Digite um novo nome: ";
}
while (<ARQ>) { print $_ };
