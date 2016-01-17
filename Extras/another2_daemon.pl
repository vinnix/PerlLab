#!/usr/bin/env perl
use warnings;
use strict;

use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Daemon::Control;

$0 = 'daemon email';

Daemon::Control->new(
  {
    name      => "email daemon",
    lsb_start => '$syslog $remote_fs',
    lsb_stop  => '$syslog',
    lsb_sdesc => 'Daemon de envio de emails',
    lsb_desc  => 'Controla o daemon de envio de emails',

    program     => "$Bin/bin/email.pl",
    pid_file    => '/tmp/email.pid',
    stderr_file => '/tmp/email.out',
    stdout_file => '/tmp/email.out',
    fork        => 2,

  }
)->run;