#!/usr/bin/perl

use strict;
use warnings;

use XML::LibXML;

my ($func_name, $the_string) = @ARGV;

# Construct dispatch table for functions available
my %disp_table = (parse_library_XML_file => \&parse_library_XML_file,
		 validate_schema => \&validate_schema);

($disp_table{$func_name} || sub {die("Invalid function name.\n")})->($the_string);


sub parse_library_XML_file {
	my $filename = shift;

	my $parser = XML::LibXML->new();
	my $doc = $parser->parse_file($filename);	
	
	#foreach my $book ($doc->findnodes('library/book')) {
	#	my $title = $book->findnodes('./title');
	#	print $title->to_literal,"\n"
	#}
}

sub validate_schema {
	my $schema_filename = @_[0]; # shift;
	my $document_filename = @_[1]; # shift;

	my $doc = XML::LibXML->new->parse_file($document_filename);

	my $xmlschema = XML::LibXML::Schema->new( location => $schema_filename);
	# For when you have a string containing the schema
	#$xmlschema = XML::LibXML::Schema->new( string => $xmlschemastring );
	eval { $xmlschema->validate( $doc ); };

}
