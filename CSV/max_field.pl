#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;

my $csv = Text::CSV->new();
my @max_lengths;

while ( my $line = <STDIN> ) {

    die "Unable to parse '$line'" unless $csv->parse($line);

    my @column_lengths = map { length } $csv->fields();

    for my $i ( 0 .. $#column_lengths ) {
        if ( $column_lengths[$i] > ($max_lengths[$i] || 0) ) {
            $max_lengths[$i] = $column_lengths[$i];
        }
    }
}

print "Max lengths, each field: @max_lengths\n";
