#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Onix;
use Onix::XML;
use Onix::ValidateXML;
use Data::Dumper;

# The test file. But we send this from the command line now.
#my $file = "$FindBin::Bin/../ONIX_Books_3.0_sample_1/sample_1_reference_names.xml";

my $onix = Onix->new_with_options();
my $file = $onix->xml_file;

print "Processing file: $file\n";

my $valid = Onix::ValidateXML->new(xml => $file);
if ( !$valid ) {
	print "\nCan not prcess the XML file because of the above errors\n";
	exit 0;
}

print "File is valid XML\n";

my $xml = Onix::XML->new( file => $file );

#my $ok = $onix->validate_codes($xml);
#if ( !$ok ) {
#	print "Invalid codes used\n";
#	exit 0;
#}

my $ok = $onix->create_products($xml);

print "Done\n";

