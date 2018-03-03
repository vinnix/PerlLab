#!/bin/env perl
#
#
#

print "Isto é um teste\n" if (22==1);

#die "Este programa acaba aqui! \n";

if ($? == 255)
{
	print "Dentro do if";
}
print "Isto é um outro teste\n" if 22==21+1;
