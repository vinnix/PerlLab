#!/opt/perl5/bin/perl
#!/usr/bin/perl

use strict;
use warnings;
use App::Daemon qw( daemonize ); 
use DBI;
use POSIX;
use Email::Send::SMTP::Gmail;


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
	while ( my ($id_fila_alerta, $obs, $status_alerta, $dt_alerta_gerado, $dt_alerta_enviado) = $sth->fetchrow_array) 
	{	
		print STDERR "[db_daemon] Enviando email: $id_fila_alerta = $obs \n" if $DEBUG;
		send_email($obs);
		my $sth2 = $dbh->prepare("UPDATE alertas.tb_fila_envio_alertas SET status_alerta = 'ENVIADO', dt_alerta_enviado = now() WHERE id_fila_alerta = $id_fila_alerta") || die "Erro DBI->prepare: $DBI::errstr\n";
		$sth2->execute() || die "Erro DBI->execute: $DBI::errstr\n";
		$sth2->finish();
		
	}
	$sth->finish();
	sleep 05;
	print STDERR "[db_daemon] inside main loop (end) \n" if $DEBUG;
}

sub finish_daemon
{
	print STDERR "[db_daemon] disconecting from database... \n" if $DEBUG;
	$dbh->disconnect();
	print STDERR "[db_daemon] disconected. \n" if $DEBUG;
	close(STDERR);
}


sub send_email
{
	my @se_args = @_;

	my $pfile = "gmail_pass.conf";
	open(ARQ,"< $pfile");
	my $pass = <ARQ>;
	close(ARQ);
	$pass =~ s/\n|^M//g ;
	my $gmail_user = 'pganalytics.sender@gmail.com';
	my $version = "Versão: 0.02";

	my ($mail,$error) = Email::Send::SMTP::Gmail->new( -smtp=>'smtp.gmail.com',
                                                   	   -login=>$gmail_user,
                                                   	   -pass=>$pass);

	print "session error: $error" unless ($mail!=-1);

	my $att;
	$att->[0]->{file}='./README';
	$att->[1]->{file}='./Attachment_TESTE.txt';

	$mail->send(-to=>'dba@dextra-sw.com',   # $se_args[1];
                    -subject=>'[pgAnalytics] Teste de envio de relatório das estatísticas, Alertas, Logs e Monitoramento',
                    -body=>"<h1>Teste</h1><br>Este é um email de teste[ $version ], favor desconsiderar.<br> ". $se_args[0] . " <br><br> ",
            	    -contenttype=>'text/html',
                    -attachmentlist=>$att);

	$mail->bye;

}
