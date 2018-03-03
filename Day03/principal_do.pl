#!/bin/env perl
#
#
#
use strict;
use warnings;

#use lib "./libs";

use libs::Pack::teste;



our $a = 10;
 my $b = 20;

#do "inc_do.pl";
#require 'inc_do.pl';
print "Comecei o programa.... \n";

my $plataforma = "UNIX";
if ($plataforma eq "Windows")
{
	print "Importando Windows...\n";
	use TesteWin;
}
elsif ($plataforma eq "UNIX")
{
	print "Importando Unix...\n";
	use TesteUnix;
}

use inc_do;
print "Feito: \$a=$a \$b=$b.\n\n\n\n";

#do "inc_do.pl";
#require 'inc_do.pl';
use inc_do;
print "De novo: \$a=$a \$b=$b.\n";




sub BEGIN {
	print "Olá, passei pelo construtor do programa em PERL...\n\n";
        push @INC, "./Pack/";
}

sub END {
	print "Olá, passei pelo destrutor do programa em PERL...\n\n";
}



