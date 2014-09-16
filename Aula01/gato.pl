#!/bin/env perl
#
#
print "Lista de parâmetros: @ARGV \n";
foreach $parametro ( @ARGV )
{
	print "Imprimindo o arquivo: ", $parametro , "\n\n";
	$i =0;
	open (ARQUIVO,"$parametro");
	while ($_ = <ARQUIVO>) 
	{
		$i++;
		print "$i: ", $_ ;
	}
	close (ARQUIVO);
}
