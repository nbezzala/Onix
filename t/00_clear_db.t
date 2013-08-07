#!/usr/bin/perl

use strict;
use warnings;
use Test::Most;

my $cmd = "mysql onix < sql/create_tables.sql";
system($cmd);

done_testing;
