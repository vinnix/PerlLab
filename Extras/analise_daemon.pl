#!/bin/env perl

use strict;
use warnings;

use constant LOG_DIR    => '/var/log/analisador';
use constant LOG_FILE   => 'analisador.log';

use Proc::PID::File;
use Proc::Daemon;
use Log::Dispatch;
use Log::Dispatch::File;
use Date::Format;
use File::Spec;

sub dienice ($);

#
# fork and background process
#

our $ME = $0; 
$ME =~ s|.*/||;


startDaemon();


##
## Setup a logging agent
##
our $HOSTNAME = `hostname`;
chomp $HOSTNAME;
my $log = new Log::Dispatch( callbacks => sub { my %h=@_; return Date::Format::time2str('%B %e %T', time)." ".$HOSTNAME." $0\[$$]: ".$h{message}."\n"; });
   $log->add( Log::Dispatch::File->new( name      => 'file1',
                                        min_level => 'warning',
                                        mode      => 'append',
                                        filename  => File::Spec->catfile( LOG_DIR, LOG_FILE),
                                      )
            );
  $log->warning("Starting Processing:  ".time());


#
# Setup signal handlers so that we have time to cleanup before shutting down
#

my $keep_going = 1;
print "KeepGoing.... $keep_going .... \n\n";
$SIG{HUP}  = sub { $log->warning("Caught SIGHUP:  exiting gracefully"); $keep_going = 0; };
$SIG{INT}  = sub { $log->warning("Caught SIGINT:  exiting gracefully"); $keep_going = 0; };
$SIG{QUIT} = sub { $log->warning("Caught SIGQUIT:  exiting gracefully"); $keep_going = 0; };
$SIG{TERM} = sub { $log->warning("Caught SIGTERM:  exiting gracefully"); $keep_going = 0; };

print "KeepGoing.... $keep_going .... \n\n";

#
# enter main loop
#

while ($keep_going) {

        # do "Analisador"'s Stuff here
        print "$keep_going .... >>>> \n";

}


#
# Mark a clean exit in the log
#
$log->warning("Stopping Processing:  ".time());


#
# startDaemon
#
# Fork and detach from the parent process
#
sub startDaemon {

   #
   # Fork and detach from the parent process
   #
   #  eval { close DATA; }; # having __END__ will trigger __DATA__ to open and should be closed
   print "daemon.... \n\n";  
   eval { Proc::Daemon::Init; };
   print "daemon2.... \n\n";  

   if ($@) {
   	     print "Variavel $@ ... \n\n";  
             dienice("Unable to start daemon:  $@");
   }

   #
   # Get a PID file
   #
   print "OHH $@ ... \n\n";  
   dienice("Already running!") if Proc::PID::File->running();
}

#
# dienice
#
# write die messages to the log before die'ing
#
sub dienice ($) {
   my ($package, $filename, $line) = caller;

   $log->critical("$_[0] at line $line in $filename");
   die $_[0];
}
