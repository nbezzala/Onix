#!/usr/bin/perl

# This is used for DEVELOPMENT ONLY
# There is no need to change this when it is moved to test or prod
#
use DBIx::Class::Schema::Loader qw/make_schema_at/;

make_schema_at(
	"DB::Schema",
	{ 
		debug => 1,
		dump_directory => './test',
	}, 
	[ "dbi:mysql:dbname=onix;host=localhost","root" ],
);

