#!/bin/env perl

use strict;
use warnings;
use Getopt::Long;
use Proc::Daemon;
use Cwd;
use File::Spec::Functions;

my $pf = catfile(getcwd(), 'pidfile.pid');
my $daemon = Proc::Daemon->new(
	pid_file => $pf,
	work_dir => getcwd()
);
# are you running?  Returns 0 if not.
my $pid = $daemon->Status($pf);
my $daemonize = 1;

GetOptions(
	'daemon!' => \$daemonize,
	"start" => \&run,
	"status" => \&status,
	"stop" => \&stop
);

sub stop {
        if ($pid) {
	        print "Stopping pid $pid...\n";
	        if ($daemon->Kill_Daemon($pf)) {
		        print "Successfully stopped.\n";
	        } else {
		        print "Could not find $pid.  Was it running?\n";
	        }
         } else {
                print "Not running, nothing to stop.\n";
         }
}

sub status {
	if ($pid) {
		print "Running with pid $pid.\n";
	} else {
		print "Not running.\n";
	}
}

sub run {
	if (!$pid) {
		print "Starting...\n";
		if ($daemonize) {
			# when Init happens, everything under it runs in the child process.
			# this is important when dealing with file handles, due to the fact
			# Proc::Daemon shuts down all open file handles when Init happens.
			# Keep this in mind when laying out your program, particularly if
			# you use filehandles.
			$daemon->Init;
		}

		while (1) {
            open(my $FH, '>>', catfile(getcwd(), "log.txt"));
                        # any code you want your daemon to run here.
                        # this example writes to a filehandle every 5 seconds.
			print $FH "Logging at " . time() . "\n";
			close $FH;
			sleep 5;
		}
	} else {
		print "Already Running with pid $pid\n";
	}
}
