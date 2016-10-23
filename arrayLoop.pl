#!/usr/bin/perl

@ages = (15, 17, 18);
@names = ("Bleep", "Bloop", "Blepper");
# Need to pass reference to the array, and dereference within subroutine
print_names_and_ages(\@ages,\@names);
sub print_names_and_ages {
	my @ages = @{$_[0]};
	my @names = @{$_[1]};

	for (my $i = 0; $i < 3; $i++){
		print $names[$i]." is ".$ages[$i]." years old.\n";
	}
}
