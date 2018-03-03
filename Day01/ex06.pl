#!/bin/env perl
#
#


$hex_t = "0xFF";
$oct_t = "031";
$bin_t = "0b11010";
$exp_t = "2.31e4";


print oct($hex_t), ' ', oct($oct_t), ' ', oct($bin_t), "\n";
print hex($hex_t), ' ', hex($oct_t), ' ', hex($bin_t), "\n";

print $exp_t, ' = ', $exp_t+0, "\n";
