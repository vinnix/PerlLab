#!/bin/env perl
#
#
use Fcntl; # para certas constantes
use SDBM_File;

my %dbm;
my $arqdbm = "demo.dbm";

tie %dbm, 'SDBM_File', $arqdbm, O_CREAT|O_RDWR, 0644;

#$dbm{Fulano} = "São Paulo";          # apenas escalares
$dbm{Vinicius} = "Indaiatuba";          # apenas escalares
$dbm{Beltrano} = "Belo Horizonte";   # referências seriam gravadas
$dbm{Ciclano} = "Rio de Janeiro";    # como endereços... inúteis
untie %dbm; # fecha o banco...

tie %dbm, 'SDBM_File', $arqdbm, O_CREAT|O_RDWR, 0644;

delete $dbm{Ciclano};

foreach (sort keys %dbm) {           # imprime tudo...
   print "$_ : $dbm{$_}\n";
}

undef %dbm; # zera o banco de dados !!
untie %dbm; # fecha o banco...
#
