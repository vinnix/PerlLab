#!/bin/env perl
#


use App::Daemon qw( daemonize ); 

daemonize();


my $keep_going = 1;
print "KeepGoing.... $keep_going .... \n\n";
$SIG{HUP}  = sub { $log->warning("Caught SIGHUP:  exiting gracefully"); $keep_going = 0; };
$SIG{INT}  = sub { $log->warning("Caught SIGINT:  exiting gracefully"); $keep_going = 0; };
$SIG{QUIT} = sub { $log->warning("Caught SIGQUIT:  exiting gracefully"); $keep_going = 0; };
$SIG{TERM} = sub { $log->warning("Caught SIGTERM:  exiting gracefully"); $keep_going = 0; };

print "KeepGoing.... $keep_going .... \n\n";


# enter main loop


while ($keep_going) {
	my $data = `date`;
	open(ARQ,">> teste.log");
	print ARQ "[daemon] $data \n";
	close(ARQ);

sleep(10);
}
