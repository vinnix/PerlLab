#!/usr/local/bin/perl

package Vinnix::Cassandra;

use Cassandra::Lite;
use Data::Dumper;
use Moose;
use strict;

my $c;

my $debug = 0;

#  just define $columnFamily and $key
my $columnFamily = 'Users';

sub connect
{
     $c = Cassandra::Lite->new(
                server_name => 'localhost',      # optional, default to '127.0.0.1'
                server_port => 9160,             # optional, default to 9160
                username => '',                  # optional, default to empty string ''
                password => '',                  # optional, default to empty string ''
                consistency_level_read => 'ONE', # optional, default to 'ONE'
                consistency_level_write => 'ONE',# optional, default to 'ONE'
                transport_read => 1024,          # optional, default to 1024
                transport_write => 1024,         # optional, default to 1024
                keyspace => 'Keyspace1',         #
            );
}

sub save
{
    my $self = shift;
    my $key = shift;
    
    my $values = { title => 'testing title', 
                    body => 'yeah............Body!',
                    age4 => 44,
                    age2 => ''
                 };

    # Insert it.
    $c->put($columnFamily, $key, $values );

}


sub show_columns
{

    my $self = shift;
    my $key = shift;

    # Get all columns
    my $hashRef = $c->get($columnFamily, $key);

    foreach $key (sort keys %$hashRef)
    {
        print "key: $key -> value: $hashRef->{$key} \n";
    }

    #print "First: $hashRef->{first} \n";
    print Dumper($hashRef) . " \n" if $debug;

}

sub delete
{
    my $self = shift;
    my $key  = shift;
    # Remove it
    $c->delete($columnFamily, $key );
}

sub getColumnValue
{
    my $self = shift;
    my $key = shift;
    my $column_name = shift;

    print "Getting value of column <$column_name>: ";
    my $scalarValue = $c->get($columnFamily, $key, $column_name);
    print " $scalarValue \n";

}


sub test
{


    Vinnix::Cassandra->connect();
    print "Great! Connected to Cassandra\n";

    print "Adding some new columns/values to a previous added key... \n";
    Vinnix::Cassandra->save('jsmith');

    print "Adding new columns/values to a new key... \n";
    Vinnix::Cassandra->save('jsmith2');

    # After insert two or more keys, I think that I need to ask:
    # is there a way to get all keys of certain $columnFamily? how do I make it happens?


    print "Showing all columns/values of certain key... \n";
    Vinnix::Cassandra->show_columns('jsmith');

    print "Showing only one column of certain key... \n";
    Vinnix::Cassandra->getColumnValue('jsmith','title');

    print "Deleting a key that was previous added from another application... \n";
    Vinnix::Cassandra->delete('jsmith');
    # Why this call does not delete all columns/values of jsmith key?
    # (maybe is something related with timestamps?? because jsmith values was inserted before directly from cassandra-cli)

    print "Deleting a new key... \n";
    Vinnix::Cassandra->delete('jsmith2');
    # here all column/values are deleted normaly

    print "After deleting, show columns/values of a previous added key... \n";
    Vinnix::Cassandra->show_columns('jsmith');

    print "After deleting, show columns/values of a new key... \n";
    Vinnix::Cassandra->show_columns('jsmith2');





}



Vinnix::Cassandra->test();


1;
