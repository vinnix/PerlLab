#!/usr/bin/env perl
use warnings;
use strict;

use utf8;
use v5.16;

$0 = 'daemon materialize glacier';
use Encode qw(encode_utf8);
use FindBin qw($Bin);
use lib "$Bin/../../../lib";

use Mu::SchemaWithConfig;
use Mu::Queue;

use AnyEvent;
use AnyEvent::Worker::Pool;
use Coro::Semaphore;

use Coro::Semaphore;
use JSON qw(decode_json encode_json);


my $bail_out = 0;

my $schema = Mu::SchemaWithConfig->connect('mu');
my $queue  = Mu::Queue->new_with_config;

my $node_rs               = $schema->resultset('Node');
my $snapshots_archives_rs = $schema->resultset('NodeSnapshotArchive');
my $sem                   = Coro::Semaphore->new(10);
my $pool                  = AnyEvent::Worker::Pool->new(
  10,
  sub {
    my $data = shift;
    $snapshots_archives_rs->consolidate_archive( $data->{JobId} );
  }
);

$queue->consume(
  'b-datum-archive-job-ready',
  no_ack       => 0,
  consumer_tag => 'bdatum' . rand
);

sub exit_if_idle {
  $queue->disconnect(), exit(0) if !@{ $pool->{queue} || [] };
}

while (1) {
  while ( my $message = $queue->recv ) {
    $SIG{USR1} = sub { exit_if_idle; $bail_out = 1; };
    $SIG{INT}  = sub { exit_if_idle; $bail_out = 1; };
    my $archive = decode_json($message);
    $sem->down;
    $pool->do( $archive, sub { $sem->up; return; } );

    if ($bail_out) {
      print "Parando...\n";
      $queue->disconnect();
      print "ok!\n";
      exit(0);
    }
  }
  sleep(2);
}

exit(0);