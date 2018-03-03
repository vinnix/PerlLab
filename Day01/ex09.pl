#!/bin/env perl
#
#


$comando = "pwd";
print `$comando`, "\n";
print "Status:" , $? , ". \n";
