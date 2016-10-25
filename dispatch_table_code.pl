#!/usr/bin/perl

use strict;
use warnings;


my ($func_name, $the_string) = @ARGV;

# Construct dispatch table for functions available
my %disp_table = (unique_char_0 => \&unique_char_0 ,
			unique_char_1 => \&unique_char_1 );

($disp_table{$func_name} || sub {die("Invalid function name.\n")})->($the_string);

