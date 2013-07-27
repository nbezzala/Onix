#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Onix;
use Onix::Product;
use Onix::ValidateXML;
use Data::Dumper;

# The test file. But we send this from the command line now.
#my $file = "$FindBin::Bin/../ONIX_Books_3.0_sample_1/sample_1_reference_names.xml";

my $onix = Onix->new_with_options();
my $file = $onix->xml_file;

my $valid = Onix::ValidateXML->new(xml => $file);

my $product = Onix::Product->new( file => $file );

print "RecordReference: ", $product->record_ref, "\n";
print "Descriptive Detail: ", $product->desc_detail, "\n";
print $product->prod_ident->pid_type, "\n";
print $product->prod_ident->id_value, "\n";

my $ok = $onix->create_product($product);
