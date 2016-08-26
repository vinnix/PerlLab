#!/bin/env perl


# Imagine you are given a plain text, ASCII, English document, something like a
# book from Project Gutenberg. Develop a concordance for the book -- the number of
# times each word appears -- and then print the top N most frequent words and how many
# times they occur. N can be either hardcoded or a parameter.



use strict;

my $N  ;
my $file_path = "book.txt";


local $/; #this is necessary to put the entire file into a scalar variable without any problem

open (my $FILE, "<", $file_path ) or die "Can't open file $file_path";
my $word_list = <$FILE>;
close ($FILE);

my %count_word_rank ;
my @words = split(/\b|\n| /, $word_list);


print "The word list is:\n $word_list\n";


if (! defined $ARGV[0] )
{
	print "Please enter N (max words to see in the rank).\n";
	$N = <STDIN>; 
	chomp($N);
}
else
{
	print "Using parameter to define N.\n";
	$N = $ARGV[0];
}

foreach my $word (@words)
{
    if (defined $count_word_rank{$word})
    {
  	$count_word_rank{$word} += 1;
    }
    else 
    {
  	$count_word_rank{$word} = 1;
    }
}

# foreach my $word (sort { $hash_count_word_rank{$a} <=> $hash_count_word_rank{$b} } keys %hash_count_word_rank)

my $word_count = 0;
print "Sorting and couting words... \n";
foreach my $word (sort {$count_word_rank{$b} <=> $count_word_rank{$a}  } keys %count_word_rank )
#foreach my $word (sort {$count_word_rank{$a} <=> $count_word_rank{$b}  } keys %count_word_rank )
{
    $word_count++;
    print "The word \"$word\" ocours $count_word_rank{$word} time(s). \n" if $word_count <= $N; 
}

print "The number of the words in file is: $word_count \n";


