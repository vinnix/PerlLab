
print "Imprimindo pacote: teste \n\n";

sub BEGIN {
	print "OK, passei pelo contrutor de pacote: teste\n\n";
}

sub END {
	print "OK, passei pelo destrutor de pacote: teste\n\n";
}

our $atr1 = "Atributo de TESTE";

sub minha_sub {
	print "Minha Sub está funcionando \n";
}
