#!/bin/env perl
#

@array = (53,29,11,32,7);

sub numericamente {
	$a <=> $b   
	#$a cmp $b   
		    # -1  se for <
		    #  0  se for =
		    #  1  se for >
}

@ordenapornumero = sort numericamente @array;

foreach $num (@ordenapornumero)
{
	print $num , "\n";
}
