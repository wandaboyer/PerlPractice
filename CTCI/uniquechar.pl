#!/usr/bin/perl

use strict;
use warnings;

use List::MoreUtils qw/all/;

# From p. 90 of CTCI Q #1.1

my ($func_name, $the_string) = @ARGV;

# Construct dispatch table for functions available
my %disp_table = (unique_char_0 => \&unique_char_0 ,
			unique_char_1 => \&unique_char_1 );

($disp_table{$func_name} || sub {die("Invalid function name.\n")})->($the_string);

# Determines if string has all unique chars by keeping a dict of chars seen so far, with keys fo chars associated with a count.
sub unique_char_0 {
	my $the_string = shift;
	
	# Init empty array with empty list
	my %char_count = ();
	foreach my $character (split('', $the_string)){
		if ($char_count{$character}) {
			$char_count{$character} = $char_count{$character} + 1;
		}
		else {
			$char_count{$character} = 1;
		}
	}

	if (all{$_ == 1} values %char_count) {
		print("All characters unique.\n");
		exit;
	}	

	keys %char_count; # reset internal iterator so prior each() doesn't mess with it
	while (my ($character, $count) = each %char_count) {
		if ($count > 1) {
			print "String has repeated character '$character' $count times.\n";	
		}
	}
}

# Determines if a string has all unique characters without the use of an additional datastructure.
sub unique_char_1 {


}

