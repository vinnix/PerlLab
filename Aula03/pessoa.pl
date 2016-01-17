#!/bin/env perl

use Pessoa;

my $pessoa = Pessoa->new (
	pre => "Albert", nome => "Einstein",
	ocup => "Físico", pais => "Alemanha");
do {
	my $outra = Pessoa->new ();
	$outra->pre("José");
	$outra->nome("Leite Lopes");
	$outra->ocup("Físico");
	$outra->pais("Brasil");
};

my $outra = Pessoa->new ();
$outra->pre("Cesar");
$outra->nome("Lattes");
$outra->ocup("Físico");
$outra->pais("Brasil");

print "Quantos: ", Pessoa->quantos, "\nQuais:\n";
foreach my $p (Pessoa->todos) 
{
	print "- ", $p->completo, "\n";
}

