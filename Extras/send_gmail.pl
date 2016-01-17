#!/opt/perl5/bin/perl
#
#
#
use strict;
use warnings;
 
use Email::Send::SMTP::Gmail;

my $pfile = "gmail_pass.conf";
open(ARQ,"< $pfile");
my $pass = <ARQ>;
close(ARQ);
$pass =~ s/\n|//g ;

my $gmail_user = 'pganalytics.sender@gmail.com';
my $version = "Versão: 0.01";



my ($mail,$error) = Email::Send::SMTP::Gmail->new( -smtp=>'smtp.gmail.com',
                                                   -login=>$gmail_user,
                                                   -pass=>$pass);
 
print "session error: $error" unless ($mail!=-1);

my $att;
$att->[0]->{file}='./README';
$att->[1]->{file}='./Attachment_TESTE.txt';
 
$mail->send(-to=>'dba@dextra-sw.com', 
	    -subject=>'[pgAnalytics] Relatório das Estatísticas, Logs e Monitoramento', 
	    -body=>"<h1>Teste</h1><br>Este é um email de teste[ $version ], favor desconsiderar.<br>Novo Teste!",
	    -contenttype=>'text/html',
            -attachmentlist=>$att);
 
$mail->bye;
