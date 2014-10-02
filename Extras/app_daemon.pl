#!/bin/env perl
#


use App::Daemon qw( daemonize ); 

daemonize();


my $data = `date`;
open(ARQ,">> teste.log");
print ARQ "[daemon] $data \n";
close(ARQ);

sleep(10);
