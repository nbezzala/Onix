package Onix::ValidateXML;

use Moose;
use XML::LibXML;
use Try::Tiny;
use lib "$FindBin::Bin/../lib";

# xml file is a command line parameter and is passed to us
# from the .pl file when this object is created
has 'xml' => ( isa => 'Str', is => 'rw', );
has 'xsd' => ( isa => 'Str', is => 'rw', );
			
sub BUILD {
	my $self = shift;
	my $xml	 = shift;

	# We should have this downloaded from the Onix website
	# This can not be a comman line parameter.
	$self->xsd("$FindBin::Bin/..//ONIX_Books_3.0_sample_1/reference.xsd");
}

sub validate {
	my $self = shift;

	my $schema = XML::LibXML::Schema->new(location => $self->xsd);
	my $parser = XML::LibXML->new;
	my $doc = $parser->parse_file($self->xml);

	eval { $schema->validate($doc) };

	if ( my $ex = $@ ) {
		print $ex;
		return 0; #Invalid
	} else {
		return 1; # Valid XML
	}
}

1;
