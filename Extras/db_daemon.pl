#!/opt/perl5/bin/perl
#!/usr/bin/perl

use strict;
use warnings;
use App::Daemon qw( daemonize ); 
use DBI;
use POSIX;

daemonize();

my $DEBUG = 1;
my $keep_going = 1;

open(STDERR,"> teste.log");

print STDERR "[db_daemon] Starting.... teste 1 \n" if $DEBUG;
print STDERR "[db_daemon] keepgoing value: $keep_going \n" if $DEBUG;

$SIG{HUP}  = sub { $keep_going = 0; finish_daemon(); }; 
$SIG{INT}  = sub { $keep_going = 0; finish_daemon(); };
$SIG{QUIT} = sub { $keep_going = 0; finish_daemon(); };
$SIG{TERM} = sub { $keep_going = 0; finish_daemon(); };

print STDERR "[db_daemon] KeepGoing.... $keep_going  \n" if $DEBUG;
my $dbname = "pganalytics";
my $dbh = DBI->connect("dbi:Pg:dbname=$dbname", "pganalytics", "") || die "Erro DBI->connect: $DBI::errstr\n";
print STDERR "[db_daemon] after DBI->connect (...) \n" if $DEBUG;


print STDERR "[db_daemon] processando fila de envio de alertas... \n" if $DEBUG;
$keep_going = 1;
while ($keep_going) 
{
	print STDERR "[db_daemon] inside main loop (begin) \n" if $DEBUG;
	my $sth = $dbh->prepare("SELECT * FROM alertas.tb_fila_envio_alertas ta  WHERE ta.status_alerta = 'GERADO'  ") || die "Erro DBI->prepare: $DBI::errstr\n";
	$sth->execute() || die "Erro DBI->execute: $DBI::errstr\n";
	while ( my ($chave, $atrib) = $sth->fetchrow_array) 
	{
		print STDERR "[db_daemon]  $chave = $atrib\n" if $DEBUG;
	}
	$sth->finish();
	sleep 10;
	print STDERR "[db_daemon] inside main loop (end) \n" if $DEBUG;
}

sub finish_daemon
{
	print STDERR "[db_daemon] disconecting from database... \n" if $DEBUG;
	$dbh->disconnect();
	print STDERR "[db_daemon] disconected. \n" if $DEBUG;
	close(STDERR);
}

