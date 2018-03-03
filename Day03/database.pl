#!/bin/env perl
#
use strict;
use warnings;

use DBI;

my $dbname = "mauricio";
my $dbh = DBI->connect("dbi:Pg:dbname=$dbname", "", "") || die "Erro DBI->connect: $DBI::errstr\n";
my $sth = $dbh->prepare("select * from simples;") || die "Erro DBI->prepare: $DBI::errstr\n";
$sth->execute() || die "Erro DBI->execute: $DBI::errstr\n";
while ( my ($chave, $atrib) = $sth->fetchrow_array) {
	print "$chave = $atrib\n";
}
$sth->finish();
$dbh->disconnect();

