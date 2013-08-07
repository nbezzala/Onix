#!/usr/bin/perl

use strict;
use warnings;
use Test::Most;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $file = "t/xml/correct1.xml";
my $cmd = "perl bin/run.pl --xml_file=$file";
system($cmd);

print "Ran the command\n";

{
package TestDB;
use Moose;
with 'Onix::DB';

print "Inside the test class\n";

package main;
print "Defined a Test class \n";

my $tdb = TestDB->new();

my $count = $tdb->schema->resultset('Product')->search()->count;
is($count, 1, "One Product created for correct1.xml");
}

# Delete all rows and get ready for the next test
$cmd = "mysql onix < sql/create_tables.sql";
system($cmd);

done_testing;
