#!/usr/bin/perl

# A pragma is a module which influences some aspect of the compile time or run time behaviour of Perl, such as strict or warnings . With Perl 5.10 you are no longer limited to the built in pragmata; you can now create user pragmata that modify the behaviour of user functions within a lexical scope.

# http://perldoc.perl.org/strict.html
use strict;
use warnings;


do_thangs("file.txt");

###### sub declarations here
sub do_thangs{
	my $filename = shift;

	print("What is your name?\n");
	my $name = <STDIN>;
	chomp $name;
	print("Hi, $name! Here are the contents of $filename.\n\n");

	#my ($a) = @_;
	# < or r - read only
	# > or w - creates, writes, and truncates.
	# +> or w+ - reads, writes, creates, and truncates
	# +< or r+ - reads and writes
	# >> or a - writes, appends, and creates 
	# +>> or a+ - reads, writes, appends, creates

	open(DATA, "<$filename") or die "Couldn't find file titled $filename!\n";
	my @lines = <DATA>;	
	
	foreach my $line (@lines){
		chomp $line;
		print("$line \n");
	}

}
