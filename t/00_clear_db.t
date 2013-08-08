#!/usr/bin/perl

use strict;
use warnings;
use Test::Most;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $cmd = "mysql onix < sql/create_tables.sql";
system($cmd);

package TestDB;
use Moose;
with 'Onix::DB';


package main;

my $tdb = TestDB->new();
my $count = $tdb->schema->resultset('Product')->search()->count;
is($count, 0, "All Products deleted ");

done_testing;
